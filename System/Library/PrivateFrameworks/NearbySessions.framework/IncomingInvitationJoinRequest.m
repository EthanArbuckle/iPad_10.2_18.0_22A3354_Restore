@implementation IncomingInvitationJoinRequest

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, IncomingInvitationJoinRequest.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions29IncomingInvitationJoinRequest *v5;

  v4 = a3;
  v5 = self;
  IncomingInvitationJoinRequest.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions29IncomingInvitationJoinRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions29IncomingInvitationJoinRequest *)IncomingInvitationJoinRequest.init(coder:)(a3);
}

- (_TtC14NearbySessions29IncomingInvitationJoinRequest)init
{
  _TtC14NearbySessions29IncomingInvitationJoinRequest *result;

  result = (_TtC14NearbySessions29IncomingInvitationJoinRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_invitationID;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_remotePublicKey), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_remotePublicKey]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_userInfo), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_userInfo]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14NearbySessions29IncomingInvitationJoinRequest_hostInfo));
}

@end
