@implementation InvitationJoinResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions22InvitationJoinResponse *v5;

  v4 = a3;
  v5 = self;
  InvitationJoinResponse.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions22InvitationJoinResponse)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions22InvitationJoinResponse *)InvitationJoinResponse.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, InvitationJoinResponse.description.getter);
}

- (_TtC14NearbySessions22InvitationJoinResponse)init
{
  _TtC14NearbySessions22InvitationJoinResponse *result;

  result = (_TtC14NearbySessions22InvitationJoinResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions22InvitationJoinResponse_userInfo), *(_QWORD *)&self->sessionIdentifier[OBJC_IVAR____TtC14NearbySessions22InvitationJoinResponse_userInfo]);
}

@end
