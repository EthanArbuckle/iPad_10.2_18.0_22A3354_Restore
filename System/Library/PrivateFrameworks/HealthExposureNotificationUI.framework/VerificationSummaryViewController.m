@implementation VerificationSummaryViewController

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI33VerificationSummaryViewController *v2;

  v2 = self;
  VerificationSummaryViewController.viewDidLoad()();

}

- (void)didTapLearnMoreButton
{
  id v3;
  _TtC28HealthExposureNotificationUI33VerificationSummaryViewController *v4;
  id v5;
  id v6;

  type metadata accessor for OnboardingInfoViewController();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7A0]), sel_initWithRootViewController_, v5);

  -[VerificationSummaryViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v6, 1, 0);
}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI33VerificationSummaryViewController *v2;

  v2 = self;
  sub_21CD2D1F0();

}

- (void)didTapSecondaryButton
{
  _TtC28HealthExposureNotificationUI33VerificationSummaryViewController *v2;

  v2 = self;
  sub_21CD2E24C();

}

- (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI33VerificationSummaryViewController *result;

  result = (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI33VerificationSummaryViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI33VerificationSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationSummaryViewController_secondaryButton));
}

@end
