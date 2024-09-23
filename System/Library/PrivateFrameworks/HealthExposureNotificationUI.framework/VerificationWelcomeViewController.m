@implementation VerificationWelcomeViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD688A4();

}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI33VerificationWelcomeViewController *v2;

  v2 = self;
  sub_21CD68E70();

}

- (void)didTapCancel
{
  uint64_t v2;
  _TtC28HealthExposureNotificationUI33VerificationWelcomeViewController *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationWelcomeViewController_flow);
  v3 = self;
  sub_21CD0EF3C(v3, v2);

}

- (_TtC28HealthExposureNotificationUI33VerificationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI33VerificationWelcomeViewController *result;

  result = (_TtC28HealthExposureNotificationUI33VerificationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VerificationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI33VerificationWelcomeViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI33VerificationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationWelcomeViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationWelcomeViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VerificationWelcomeViewController_secondaryButton));
}

@end
