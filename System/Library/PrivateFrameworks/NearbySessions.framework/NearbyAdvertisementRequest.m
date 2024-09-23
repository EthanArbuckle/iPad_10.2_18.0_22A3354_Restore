@implementation NearbyAdvertisementRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions26NearbyAdvertisementRequest *v5;

  v4 = a3;
  v5 = self;
  NearbyAdvertisementRequest.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions26NearbyAdvertisementRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions26NearbyAdvertisementRequest *)NearbyAdvertisementRequest.init(coder:)(a3);
}

- (NSString)description
{
  _TtC14NearbySessions26NearbyAdvertisementRequest *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = NearbyAdvertisementRequest.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x2494E9EDC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14NearbySessions26NearbyAdvertisementRequest)init
{
  _TtC14NearbySessions26NearbyAdvertisementRequest *result;

  result = (_TtC14NearbySessions26NearbyAdvertisementRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions26NearbyAdvertisementRequest_identifier;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions26NearbyAdvertisementRequest_invitation), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions26NearbyAdvertisementRequest_invitation]);
}

@end
