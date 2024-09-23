@implementation AFGetTimerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createResponseWithTimer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AFSiriResponse _initWithRequest:]([AFGetTimerResponse alloc], "_initWithRequest:", self);
  objc_msgSend(v5, "setTimer:", v4);

  return v5;
}

@end
