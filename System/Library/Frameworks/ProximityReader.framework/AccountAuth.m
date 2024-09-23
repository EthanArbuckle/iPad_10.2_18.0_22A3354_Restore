@implementation AccountAuth

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader11AccountAuth *v5;

  v4 = a3;
  v5 = self;
  sub_21C36A448(v4);

}

- (_TtC15ProximityReader11AccountAuth)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader11AccountAuth *)AccountAuth.init(coder:)(a3);
}

- (_TtC15ProximityReader11AccountAuth)init
{
  _TtC15ProximityReader11AccountAuth *result;

  result = (_TtC15ProximityReader11AccountAuth *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
