@implementation InvitationApprovalRequest

- (NSString)description
{
  return (NSString *)@objc NearbyGroupCreationRequest.description.getter(self, (uint64_t)a2, InvitationApprovalRequest.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14NearbySessions25InvitationApprovalRequest *v5;

  v4 = a3;
  v5 = self;
  InvitationApprovalRequest.encode(with:)((NSCoder)v4);

}

- (_TtC14NearbySessions25InvitationApprovalRequest)initWithCoder:(id)a3
{
  return (_TtC14NearbySessions25InvitationApprovalRequest *)InvitationApprovalRequest.init(coder:)(a3);
}

- (_TtC14NearbySessions25InvitationApprovalRequest)init
{
  _TtC14NearbySessions25InvitationApprovalRequest *result;

  result = (_TtC14NearbySessions25InvitationApprovalRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14NearbySessions25InvitationApprovalRequest_remoteInvitationData));
  swift_bridgeObjectRelease();
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14NearbySessions25InvitationApprovalRequest_userInfo), *(_QWORD *)&self->remoteInvitationData[OBJC_IVAR____TtC14NearbySessions25InvitationApprovalRequest_userInfo]);
}

@end
