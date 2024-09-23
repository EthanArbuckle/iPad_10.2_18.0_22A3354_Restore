@implementation IDSFeatureToggleUpdateResult

+ (id)successfulResult
{
  return -[IDSFeatureToggleUpdateResult initWithError:]([IDSFeatureToggleUpdateResult alloc], "initWithError:", 0);
}

+ (id)resultWithError:(unint64_t)a3
{
  return -[IDSFeatureToggleUpdateResult initWithError:]([IDSFeatureToggleUpdateResult alloc], "initWithError:", a3);
}

- (IDSFeatureToggleUpdateResult)initWithError:(unint64_t)a3
{
  IDSFeatureToggleUpdateResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSFeatureToggleUpdateResult;
  result = -[IDSFeatureToggleUpdateResult init](&v5, sel_init);
  if (result)
    result->_error = a3;
  return result;
}

- (BOOL)success
{
  return -[IDSFeatureToggleUpdateResult error](self, "error") == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IDSFeatureToggleUpdateResult initWithError:]([IDSFeatureToggleUpdateResult alloc], "initWithError:", -[IDSFeatureToggleUpdateResult error](self, "error"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleUpdateResult)initWithCoder:(id)a3
{
  return -[IDSFeatureToggleUpdateResult initWithError:](self, "initWithError:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("err")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSFeatureToggleUpdateResult error](self, "error"), CFSTR("err"));

}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

@end
