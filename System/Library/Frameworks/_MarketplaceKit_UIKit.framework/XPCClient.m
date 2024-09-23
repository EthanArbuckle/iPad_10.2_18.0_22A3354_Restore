@implementation XPCClient

- (void)handleMessages:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC21_MarketplaceKit_UIKit9XPCClient *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_2355E5820();
  v7 = v6;

  sub_2355DFB64(v5, v7);
}

- (_TtC21_MarketplaceKit_UIKit9XPCClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[XPCClient init](&v3, sel_init);
}

@end
