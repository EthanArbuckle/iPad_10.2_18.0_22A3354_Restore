@implementation LAPSPasscodeChangeAuthorizerBuilder

+ (id)authorizerWithOptions:(id)a3
{
  id v3;
  LAPSPasscodeChangeAuthorizerDTOAdapter *v4;
  LAPSPasscodeChangeAuthorizerDispatchDecorator *v5;

  v3 = a3;
  v4 = -[LAPSPasscodeChangeAuthorizerDTOAdapter initWithOptions:]([LAPSPasscodeChangeAuthorizerDTOAdapter alloc], "initWithOptions:", v3);

  v5 = -[LAPSPasscodeChangeAuthorizerDispatchDecorator initWithAuthorizer:]([LAPSPasscodeChangeAuthorizerDispatchDecorator alloc], "initWithAuthorizer:", v4);
  return v5;
}

@end
