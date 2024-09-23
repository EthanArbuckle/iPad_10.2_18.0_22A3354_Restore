@implementation OnboardingSummaryViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  sub_21CCFFAEC();
  v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

}

- (void)didTapPrimaryButton
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI31OnboardingSummaryViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingSummaryViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();

}

- (void)didTapCancel
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI31OnboardingSummaryViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingSummaryViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();

}

- (_TtC28HealthExposureNotificationUI31OnboardingSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI31OnboardingSummaryViewController *result;

  result = (_TtC28HealthExposureNotificationUI31OnboardingSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI31OnboardingSummaryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI31OnboardingSummaryViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI31OnboardingSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingSummaryViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingSummaryViewController_primaryButton));
}

@end
