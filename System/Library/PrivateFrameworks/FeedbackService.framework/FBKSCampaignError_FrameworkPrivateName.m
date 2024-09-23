@implementation FBKSCampaignError_FrameworkPrivateName

- (NSDate)date
{
  return (NSDate *)(id)sub_23B48335C();
}

- (int64_t)code
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_code);
}

- (NSString)domain
{
  return (NSString *)sub_23B480A00();
}

- (NSString)errorDescription
{
  return (NSString *)sub_23B480A00();
}

- (NSString)description
{
  return (NSString *)sub_23B480C6C(self, (uint64_t)a2, (void (*)(void))FBKSCampaignError.description.getter);
}

- (FBKSCampaignError_FrameworkPrivateName)init
{
  FBKSCampaignError_FrameworkPrivateName *result;

  result = (FBKSCampaignError_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date;
  v3 = sub_23B483380();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
