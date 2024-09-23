@implementation ShadowView

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8SOSBuddy10ShadowView *v10;
  id v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11 = sub_1001B0C4C(v9, v6, v8);

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (_TtC8SOSBuddy10ShadowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShadowView();
  return -[ShadowView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8SOSBuddy10ShadowView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShadowView();
  return -[ShadowView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
