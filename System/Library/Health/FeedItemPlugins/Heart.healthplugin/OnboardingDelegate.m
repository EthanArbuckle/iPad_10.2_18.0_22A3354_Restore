@implementation OnboardingDelegate

- (void)didDismissOnboarding
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate_onboardingManager);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate_onboardingManager) = 0;

}

- (_TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate)init
{
  _TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate *result;

  result = (_TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate_onboardingManager));
}

@end
