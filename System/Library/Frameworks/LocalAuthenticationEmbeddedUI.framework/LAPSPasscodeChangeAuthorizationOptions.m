@implementation LAPSPasscodeChangeAuthorizationOptions

- (LAPSPasscodeChangeAuthorizationOptions)initWithUseCase:(int64_t)a3
{
  LAPSPasscodeChangeAuthorizationOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LAPSPasscodeChangeAuthorizationOptions;
  result = -[LAPSPasscodeChangeAuthorizationOptions init](&v5, sel_init);
  if (result)
    result->_useCase = a3;
  return result;
}

- (NSURL)calloutURL
{
  return self->_calloutURL;
}

- (void)setCalloutURL:(id)a3
{
  objc_storeStrong((id *)&self->_calloutURL, a3);
}

- (NSString)calloutReason
{
  return self->_calloutReason;
}

- (void)setCalloutReason:(id)a3
{
  objc_storeStrong((id *)&self->_calloutReason, a3);
}

- (int64_t)useCase
{
  return self->_useCase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutReason, 0);
  objc_storeStrong((id *)&self->_calloutURL, 0);
}

@end
