@implementation OnboardingAddRegionWelcomeViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD724C0();

}

- (void)didTapHowExposureNotificationsWork
{
  id v3;
  _TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *v4;
  id v5;
  id v6;

  type metadata accessor for OnboardingInfoViewController();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7A0]), sel_initWithRootViewController_, v5);

  -[OnboardingAddRegionWelcomeViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v6, 1, 0);
}

- (void)didTapPrimaryButton
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();

}

- (void)didTapSecondaryButton
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();

}

- (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *result;

  result = (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI40OnboardingAddRegionWelcomeViewController_secondaryButton));
}

@end
