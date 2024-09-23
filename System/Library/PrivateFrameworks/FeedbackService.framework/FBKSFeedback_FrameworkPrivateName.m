@implementation FBKSFeedback_FrameworkPrivateName

- (NSString)formIdentifier
{
  return (NSString *)sub_23B480A00();
}

- (NSDate)submissionDate
{
  return (NSDate *)(id)sub_23B48335C();
}

- (NSString)build
{
  return (NSString *)sub_23B480A00();
}

- (int64_t)id
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_id);
}

- (NSString)description
{
  return (NSString *)sub_23B480C6C(self, (uint64_t)a2, (void (*)(void))FBKSFeedback.description.getter);
}

- (FBKSFeedback_FrameworkPrivateName)init
{
  FBKSFeedback_FrameworkPrivateName *result;

  result = (FBKSFeedback_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_submissionDate;
  v4 = sub_23B483380();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
