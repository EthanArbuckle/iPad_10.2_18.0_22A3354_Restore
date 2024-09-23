@implementation NearbyInvitationData

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, NearbyInvitationData.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions20NearbyInvitationData *v5;

  v4 = a3;
  v5 = self;
  NearbyInvitationData.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions20NearbyInvitationData)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions20NearbyInvitationData *)NearbyInvitationData.init(coder:)(a3);
}

- (_TtC14NearbySessions20NearbyInvitationData)init
{
  _TtC14NearbySessions20NearbyInvitationData *result;

  result = (_TtC14NearbySessions20NearbyInvitationData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions20NearbyInvitationData_invitationID;
  v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions20NearbyInvitationData_userInfo), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions20NearbyInvitationData_userInfo]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14NearbySessions20NearbyInvitationData_hostConnectionInfo));
  v5((char *)self + OBJC_IVAR____TtC14NearbySessions20NearbyInvitationData_sourceProviderID, v4);
  swift_bridgeObjectRelease();
}

@end
