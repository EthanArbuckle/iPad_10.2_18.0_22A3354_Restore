@implementation AFShowTimerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSiriRequestSucceededResponse alloc], "_initWithRequest:", self);
}

@end
