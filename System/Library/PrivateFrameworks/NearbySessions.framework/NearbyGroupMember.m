@implementation NearbyGroupMember

- (BOOL)isEqual:(id)a3
{
  _TtC14NearbySessions17NearbyGroupMember *v4;
  _TtC14NearbySessions17NearbyGroupMember *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = NearbyGroupMember.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC14NearbySessions17NearbyGroupMember *v2;
  Swift::Int v3;

  v2 = self;
  v3 = NearbyGroupMember.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14NearbySessions17NearbyGroupMember)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions17NearbyGroupMember *)NearbyGroupMember.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions17NearbyGroupMember *v5;

  v4 = a3;
  v5 = self;
  NearbyGroupMember.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions17NearbyGroupMember)init
{
  _TtC14NearbySessions17NearbyGroupMember *result;

  result = (_TtC14NearbySessions17NearbyGroupMember *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC14NearbySessions17NearbyGroupMember *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = NearbyGroupMember.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x2494E9EDC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end
