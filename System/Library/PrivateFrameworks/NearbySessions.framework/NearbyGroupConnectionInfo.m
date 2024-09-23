@implementation NearbyGroupConnectionInfo

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, NearbyGroupConnectionInfo.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions25NearbyGroupConnectionInfo *v5;

  v4 = a3;
  v5 = self;
  NearbyGroupConnectionInfo.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions25NearbyGroupConnectionInfo)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions25NearbyGroupConnectionInfo *)NearbyGroupConnectionInfo.init(coder:)(a3);
}

- (_TtC14NearbySessions25NearbyGroupConnectionInfo)init
{
  _TtC14NearbySessions25NearbyGroupConnectionInfo *result;

  result = (_TtC14NearbySessions25NearbyGroupConnectionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions25NearbyGroupConnectionInfo_id;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end
