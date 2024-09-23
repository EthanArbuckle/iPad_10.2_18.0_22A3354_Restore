@implementation OnboardingOpenAppStoreViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD6B4C8();

}

- (void)openAppStoreButtonTapped
{
  _TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController *v2;

  v2 = self;
  sub_21CD6BB28();

}

- (void)didTapPrimaryButton
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();

}

- (_TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController *result;

  result = (_TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController_healthAgencyModel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI36OnboardingOpenAppStoreViewController_primaryButton));
}

@end
