@implementation NearbyGroupCreationRequest

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, NearbyGroupCreationRequest.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions26NearbyGroupCreationRequest *v5;

  v4 = a3;
  v5 = self;
  NearbyGroupCreationRequest.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions26NearbyGroupCreationRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions26NearbyGroupCreationRequest *)NearbyGroupCreationRequest.init(coder:)(a3);
}

- (_TtC14NearbySessions26NearbyGroupCreationRequest)init
{
  _TtC14NearbySessions26NearbyGroupCreationRequest *result;

  result = (_TtC14NearbySessions26NearbyGroupCreationRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC14NearbySessions26NearbyGroupCreationRequest_id;
  v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
