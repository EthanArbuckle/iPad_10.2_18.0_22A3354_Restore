@implementation CardReaderErrorInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15ProximityReader23CardReaderErrorInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader23CardReaderErrorInternal *)CardReaderErrorInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader23CardReaderErrorInternal *v5;

  v4 = a3;
  v5 = self;
  sub_21C320130(v4);

}

- (NSString)description
{
  _TtC15ProximityReader23CardReaderErrorInternal *v2;
  void *v3;

  v2 = self;
  sub_21C3202D4();

  v3 = (void *)sub_21C3A7EB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15ProximityReader23CardReaderErrorInternal)init
{
  _TtC15ProximityReader23CardReaderErrorInternal *result;

  result = (_TtC15ProximityReader23CardReaderErrorInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
