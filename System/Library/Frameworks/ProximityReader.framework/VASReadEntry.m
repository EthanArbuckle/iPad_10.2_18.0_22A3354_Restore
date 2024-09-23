@implementation VASReadEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader12VASReadEntry *v5;

  v4 = a3;
  v5 = self;
  VASReadEntry.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader12VASReadEntry)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader12VASReadEntry *)VASReadEntry.init(coder:)(a3);
}

- (_TtC15ProximityReader12VASReadEntry)init
{
  _TtC15ProximityReader12VASReadEntry *result;

  result = (_TtC15ProximityReader12VASReadEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C2D2B34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ProximityReader12VASReadEntry_mobileToken), *(_QWORD *)&self->mobileToken[OBJC_IVAR____TtC15ProximityReader12VASReadEntry_mobileToken]);
  sub_21C2D2B34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ProximityReader12VASReadEntry_customerVASData), *(_QWORD *)&self->mobileToken[OBJC_IVAR____TtC15ProximityReader12VASReadEntry_customerVASData]);
  swift_bridgeObjectRelease();
}

@end
