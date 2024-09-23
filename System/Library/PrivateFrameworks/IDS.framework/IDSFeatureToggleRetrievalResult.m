@implementation IDSFeatureToggleRetrievalResult

+ (id)resultWithState:(unint64_t)a3
{
  return -[IDSFeatureToggleRetrievalResult initWithState:error:]([IDSFeatureToggleRetrievalResult alloc], "initWithState:error:", a3, 0);
}

+ (id)resultWithError:(unint64_t)a3
{
  return -[IDSFeatureToggleRetrievalResult initWithState:error:]([IDSFeatureToggleRetrievalResult alloc], "initWithState:error:", 0, a3);
}

- (IDSFeatureToggleRetrievalResult)initWithState:(unint64_t)a3 error:(unint64_t)a4
{
  IDSFeatureToggleRetrievalResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSFeatureToggleRetrievalResult;
  result = -[IDSFeatureToggleRetrievalResult init](&v7, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_error = a4;
  }
  return result;
}

- (BOOL)success
{
  return -[IDSFeatureToggleRetrievalResult error](self, "error") == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IDSFeatureToggleRetrievalResult initWithState:error:]([IDSFeatureToggleRetrievalResult alloc], "initWithState:error:", -[IDSFeatureToggleRetrievalResult state](self, "state"), -[IDSFeatureToggleRetrievalResult error](self, "error"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleRetrievalResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("st"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("err"));

  return -[IDSFeatureToggleRetrievalResult initWithState:error:](self, "initWithState:error:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSFeatureToggleRetrievalResult state](self, "state"), CFSTR("st"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSFeatureToggleRetrievalResult error](self, "error"), CFSTR("err"));

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
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
