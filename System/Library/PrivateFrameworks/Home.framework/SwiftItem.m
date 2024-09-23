@implementation SwiftItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v4;
  _TtC4Home9SwiftItem *v5;
  id v6;

  if (a3)
    v4 = sub_1DD63E098();
  else
    v4 = 0;
  v5 = self;
  v6 = sub_1DD3D6B04(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC4Home9SwiftItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftItem();
  return -[SwiftItem init](&v3, sel_init);
}

@end
