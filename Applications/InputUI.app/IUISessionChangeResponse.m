@implementation IUISessionChangeResponse

- (IUISessionChangeResponse)initWithResponseState:(int64_t)a3
{
  IUISessionChangeResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IUISessionChangeResponse;
  result = -[IUISessionChangeResponse init](&v5, "init");
  if (result)
    result->_responseState = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_responseState, CFSTR("responseState"));
}

- (IUISessionChangeResponse)initWithCoder:(id)a3
{
  return -[IUISessionChangeResponse initWithResponseState:](self, "initWithResponseState:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("responseState")));
}

- (int64_t)responseState
{
  return self->_responseState;
}

@end
