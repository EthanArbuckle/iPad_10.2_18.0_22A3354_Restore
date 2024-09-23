@implementation ACDClientProvider

- (id)createClientForConnection:(id)a3
{
  id v3;
  ACDClient *v4;

  v3 = a3;
  v4 = -[ACDClient initWithConnection:]([ACDClient alloc], "initWithConnection:", v3);

  return v4;
}

@end
