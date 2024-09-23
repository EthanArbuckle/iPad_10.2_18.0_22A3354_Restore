@implementation CRKConcreteProcessPrimitives

- (BOOL)processExistsWithIdentifier:(int)a3
{
  return kill(a3, 0) != 3;
}

- (id)subscribeToExitForProcessWithIdentifier:(int)a3 exitHandler:(id)a4
{
  uintptr_t v4;
  id v5;
  dispatch_source_t v6;
  void *v7;

  v4 = a3;
  v5 = a4;
  v6 = dispatch_source_create(MEMORY[0x24BDAC9F8], v4, 0x80000000uLL, MEMORY[0x24BDAC9B8]);
  +[CRKDispatchSourceSubscription subscriptionWithSource:handler:](CRKDispatchSourceSubscription, "subscriptionWithSource:handler:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
