@implementation HelloMessageUI

- (NSString)world
{
  _TtC9MessageUI19SwiftHelloMessageUI *v2;
  void *v3;

  v2 = objc_alloc_init(_TtC9MessageUI19SwiftHelloMessageUI);
  -[SwiftHelloMessageUI world](v2, "world");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)worldTruncatedToIndex:(int64_t)a3
{
  _TtC9MessageUI19SwiftHelloMessageUI *v4;
  void *v5;

  v4 = objc_alloc_init(_TtC9MessageUI19SwiftHelloMessageUI);
  -[SwiftHelloMessageUI worldWithTruncated:](v4, "worldWithTruncated:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
