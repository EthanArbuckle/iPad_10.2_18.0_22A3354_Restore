@implementation ElectrocardiogramFeatureStatusOnboardingManagerDelegate

- (void)didDismissOnboarding
{
  char *v1;
  id v2;

  v1 = (char *)MEMORY[0x2348DE3BC](a1+ OBJC_IVAR____TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate_delegate);
  if (v1)
  {
    v2 = *(id *)&v1[qword_25415CA40];
    *(_QWORD *)&v1[qword_25415CA40] = 0;

  }
}

- (_TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate)init
{
  _TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate *result;

  result = (_TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312D2854((uint64_t)self+ OBJC_IVAR____TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate_delegate);
}

@end
