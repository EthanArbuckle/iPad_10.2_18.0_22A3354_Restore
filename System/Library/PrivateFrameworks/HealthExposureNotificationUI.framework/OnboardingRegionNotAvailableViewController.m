@implementation OnboardingRegionNotAvailableViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD32B5C();

}

- (void)didTapPrimaryButton
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();

}

- (_TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController *result;

  result = (_TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_21CD1DD9C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController_region), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController_region));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42OnboardingRegionNotAvailableViewController_primaryButton));
}

@end
