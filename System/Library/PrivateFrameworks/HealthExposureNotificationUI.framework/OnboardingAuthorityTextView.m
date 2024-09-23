@implementation OnboardingAuthorityTextView

- (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView *result;

  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView_textView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBDA88]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView)initWithFrame:(CGRect)a3
{
  sub_21CD2145C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView_textView));
}

@end
