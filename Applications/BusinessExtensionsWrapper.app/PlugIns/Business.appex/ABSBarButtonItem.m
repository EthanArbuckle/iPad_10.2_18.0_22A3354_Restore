@implementation ABSBarButtonItem

- (NSString)title
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  v2 = v9.receiver;
  v3 = -[ABSBarButtonItem title](&v9, "title");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Business16ABSBarButtonItem *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_10006C574(v4, v6);

}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  return -[ABSBarButtonItem isEnabled](&v3, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _TtC8Business16ABSBarButtonItem *v4;

  v4 = self;
  sub_10006C6F0(a3);

}

- (_TtC8Business16ABSBarButtonItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  return -[ABSBarButtonItem init](&v3, "init");
}

- (_TtC8Business16ABSBarButtonItem)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ABSBarButtonItem();
  return -[ABSBarButtonItem initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
