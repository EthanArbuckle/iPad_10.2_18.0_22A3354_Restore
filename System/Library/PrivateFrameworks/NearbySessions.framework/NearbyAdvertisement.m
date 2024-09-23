@implementation NearbyAdvertisement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions19NearbyAdvertisement *v5;

  v4 = a3;
  v5 = self;
  NearbyAdvertisement.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions19NearbyAdvertisement)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions19NearbyAdvertisement *)NearbyAdvertisement.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, NearbyAdvertisement.description.getter);
}

- (int64_t)hash
{
  _TtC14NearbySessions19NearbyAdvertisement *v2;
  Swift::Int v3;

  v2 = self;
  v3 = NearbyAdvertisement.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC14NearbySessions19NearbyAdvertisement *v4;
  _TtC14NearbySessions19NearbyAdvertisement *v5;
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
  v6 = NearbyAdvertisement.isEqual(_:)((uint64_t)v8);

  outlined destroy of Invitation_HostConnectionInfo?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_TtC14NearbySessions19NearbyAdvertisement)init
{
  _TtC14NearbySessions19NearbyAdvertisement *result;

  result = (_TtC14NearbySessions19NearbyAdvertisement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions19NearbyAdvertisement_scannerID;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions19NearbyAdvertisement_userInfo), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions19NearbyAdvertisement_userInfo]);
  swift_unknownObjectRelease();
}

@end
