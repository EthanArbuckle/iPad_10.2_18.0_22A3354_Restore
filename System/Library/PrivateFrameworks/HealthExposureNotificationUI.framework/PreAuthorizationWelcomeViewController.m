@implementation PreAuthorizationWelcomeViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD1F034();

}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *v2;

  v2 = self;
  sub_21CD1F5F0();

}

- (void)didTapCancel
{
  void (**v3)(_QWORD);
  void (*v4)(_QWORD);
  _TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *v5;

  v3 = (void (**)(_QWORD))(*(char **)((char *)&self->super.super.super.super.super.isa
                                               + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_flow)
                                    + OBJC_IVAR____TtC28HealthExposureNotificationUI20PreAuthorizationFlow_completionHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  swift_retain();
  v4(0);

  swift_release();
}

- (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *result;

  result = (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_secondaryButton));
}

@end
