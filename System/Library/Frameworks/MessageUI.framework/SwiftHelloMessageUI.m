@implementation SwiftHelloMessageUI

- (NSString)world
{
  _TtC9MessageUI19SwiftHelloMessageUI *v2;
  id v5;

  v2 = self;
  SwiftHelloMessageUI.world.getter();

  v5 = (id)sub_1ABA6533C();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (id)worldWithTruncated:(int64_t)a3
{
  _TtC9MessageUI19SwiftHelloMessageUI *v3;
  void *v7;

  v3 = self;
  SwiftHelloMessageUI.world(truncated:)(a3);

  v7 = (void *)sub_1ABA6533C();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC9MessageUI19SwiftHelloMessageUI)init
{
  return (_TtC9MessageUI19SwiftHelloMessageUI *)SwiftHelloMessageUI.init()();
}

@end
