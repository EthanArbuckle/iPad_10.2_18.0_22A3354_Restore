@implementation FBKSCampaign_FrameworkPrivateName

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state);
}

- (NSDate)updatedAt
{
  return (NSDate *)(id)sub_23B48335C();
}

- (NSString)description
{
  return (NSString *)sub_23B480C6C(self, (uint64_t)a2, (void (*)(void))FBKSCampaign.description.getter);
}

- (FBKSCampaign_FrameworkPrivateName)init
{
  FBKSCampaign_FrameworkPrivateName *result;

  result = (FBKSCampaign_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_updatedAt;
  v3 = sub_23B483380();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
