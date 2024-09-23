@implementation FakeSecuritydXPCClient

- (FakeSecuritydXPCClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FakeSecuritydXPCClient;
  return -[FakeSecuritydXPCClient init](&v3, sel_init);
}

- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4
{
  void *v4;

  if (gSecurityd && (v4 = *(void **)(gSecurityd + 696)) != 0)
    return v4;
  else
    return 0;
}

@end
