@implementation OnboardingLegalConsentViewController

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *v2;

  v2 = self;
  OnboardingLegalConsentViewController.viewDidLoad()();

}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *v2;

  v2 = self;
  sub_21CD417A4();

}

- (void)didTapSecondaryButton
{
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *v2;

  v2 = self;
  sub_21CD41EE8();

}

- (void)didTapCancel
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();

}

- (void)didConfirmAgree
{
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *v2;

  v2 = self;
  sub_21CD41CE4();

}

- (void)didConfirmDontAgree
{
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *v2;

  v2 = self;
  sub_21CD4239C();

}

- (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *result;

  result = (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingLegalConsentViewController_secondaryButton));
}

@end
