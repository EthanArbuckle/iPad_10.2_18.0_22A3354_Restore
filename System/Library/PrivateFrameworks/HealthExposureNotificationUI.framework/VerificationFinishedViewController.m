@implementation VerificationFinishedViewController

- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithRegionDisplayName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_21CD765B0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *)VerificationFinishedViewController.init(regionDisplayName:)(v3, v4);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  sub_21CD4AA9C();
  v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

}

- (void)didTapPrimaryButton
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *, _UNKNOWN **, uint64_t, uint64_t);
  _TtC28HealthExposureNotificationUI34VerificationFinishedViewController *v6;

  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI34VerificationFinishedViewController_flow))
  {
    v3 = *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                   + OBJC_IVAR____TtC28HealthExposureNotificationUI34VerificationFinishedViewController_flow);
    ObjectType = swift_getObjectType();
    v5 = *(void (**)(_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *, _UNKNOWN **, uint64_t, uint64_t))(v3 + 120);
    v6 = self;
    swift_unknownObjectRetain();
    v5(v6, &protocol witness table for VerificationFinishedViewController, ObjectType, v3);

    swift_unknownObjectRelease();
  }
  else
  {
    -[VerificationFinishedViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI34VerificationFinishedViewController *result;

  result = (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI34VerificationFinishedViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI34VerificationFinishedViewController_primaryButton));
}

@end
