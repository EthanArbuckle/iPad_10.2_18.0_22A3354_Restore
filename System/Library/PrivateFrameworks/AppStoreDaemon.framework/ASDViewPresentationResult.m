@implementation ASDViewPresentationResult

- (ASDViewPresentationResult)initWithError:(id)a3
{
  id v4;
  ASDViewPresentationResult *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDViewPresentationResult;
  v5 = -[ASDViewPresentationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    error = v5->_error;
    v5->_error = (NSError *)v6;

  }
  return v5;
}

- (ASDViewPresentationResult)initWithNumber:(id)a3
{
  id v4;
  ASDViewPresentationResult *v5;
  uint64_t v6;
  NSNumber *numberResult;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDViewPresentationResult;
  v5 = -[ASDViewPresentationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    numberResult = v5->_numberResult;
    v5->_numberResult = (NSNumber *)v6;

  }
  return v5;
}

- (ASDViewPresentationResult)initWithString:(id)a3
{
  id v4;
  ASDViewPresentationResult *v5;
  uint64_t v6;
  NSString *stringResult;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDViewPresentationResult;
  v5 = -[ASDViewPresentationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringResult = v5->_stringResult;
    v5->_stringResult = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDViewPresentationResult)initWithCoder:(id)a3
{
  id v4;
  ASDViewPresentationResult *v5;
  uint64_t v6;
  NSError *error;
  uint64_t v8;
  NSNumber *numberResult;
  uint64_t v10;
  NSString *stringResult;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDViewPresentationResult;
  v5 = -[ASDViewPresentationResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("E"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("N"));
    v8 = objc_claimAutoreleasedReturnValue();
    numberResult = v5->_numberResult;
    v5->_numberResult = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("S"));
    v10 = objc_claimAutoreleasedReturnValue();
    stringResult = v5->_stringResult;
    v5->_stringResult = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  id v5;

  error = self->_error;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", error, CFSTR("E"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberResult, CFSTR("N"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stringResult, CFSTR("S"));

}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)numberResult
{
  return self->_numberResult;
}

- (NSString)stringResult
{
  return self->_stringResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringResult, 0);
  objc_storeStrong((id *)&self->_numberResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
