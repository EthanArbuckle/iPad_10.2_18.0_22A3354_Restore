@implementation ReadResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader10ReadResult *v5;

  v4 = a3;
  v5 = self;
  ReadResult.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader10ReadResult)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader10ReadResult *)ReadResult.init(coder:)(a3);
}

- (_TtC15ProximityReader10ReadResult)init
{
  _TtC15ProximityReader10ReadResult *result;

  result = (_TtC15ProximityReader10ReadResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
