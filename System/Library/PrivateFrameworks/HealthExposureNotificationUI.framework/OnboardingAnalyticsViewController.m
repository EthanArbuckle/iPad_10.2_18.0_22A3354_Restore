@implementation OnboardingAnalyticsViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  sub_21CD735A4();
  v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *v2;

  v2 = self;
  sub_21CD73DD0();

}

- (void)didTapSecondaryButton
{
  _TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *v2;

  v2 = self;
  sub_21CD74298();

}

- (void)didTapLearnMore
{
  _TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *v2;

  v2 = self;
  sub_21CD232B4();

}

- (void)didTapDone
{
  -[OnboardingAnalyticsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *result;

  result = (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33OnboardingAnalyticsViewController_secondaryButton));
}

@end
