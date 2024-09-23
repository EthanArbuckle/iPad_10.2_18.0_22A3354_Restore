@implementation IdentityInformation

- (_TtC15ProximityReader19IdentityInformation)init
{
  _TtC15ProximityReader19IdentityInformation *result;

  result = (_TtC15ProximityReader19IdentityInformation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C2D2B34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ProximityReader19IdentityInformation_portraitData), *(_QWORD *)&self->portraitData[OBJC_IVAR____TtC15ProximityReader19IdentityInformation_portraitData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25525AF10;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25525AF10 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader19IdentityInformation *v5;

  v4 = a3;
  v5 = self;
  IdentityInformation.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader19IdentityInformation)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader19IdentityInformation *)IdentityInformation.init(coder:)(a3);
}

@end
