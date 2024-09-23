@implementation AFContextRequest

- (BOOL)_makeAppFrontmost
{
  return 0;
}

- (id)createResponseWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AFContextResponse _initWithRequest:context:]([AFContextResponse alloc], "_initWithRequest:context:", self, v4);

  return v5;
}

@end
