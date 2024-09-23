@implementation TurndownViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD272DC();

}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI22TurndownViewController *v2;

  v2 = self;
  sub_21CD27BA0();

}

- (_TtC28HealthExposureNotificationUI22TurndownViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC28HealthExposureNotificationUI22TurndownViewController *result;

  result = (_TtC28HealthExposureNotificationUI22TurndownViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI22TurndownViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI22TurndownViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI22TurndownViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI22TurndownViewController_turndownEntity));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI22TurndownViewController_primaryButton));
}

@end
