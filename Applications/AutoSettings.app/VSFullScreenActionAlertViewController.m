@implementation VSFullScreenActionAlertViewController

- (void)cancelButtonTapped
{
  -[VSFullScreenActionAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC12AutoSettings37VSFullScreenActionAlertViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000CC90();
}

- (void)viewDidLoad
{
  _TtC12AutoSettings37VSFullScreenActionAlertViewController *v2;

  v2 = self;
  sub_10000C418();

}

- (void)primaryAction
{
  void (*v2)(void);
  _TtC12AutoSettings37VSFullScreenActionAlertViewController *v3;

  v2 = *(void (**)(void))((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action);
  if (v2)
  {
    v3 = self;
    v2();

  }
}

- (_TtC12AutoSettings37VSFullScreenActionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12AutoSettings37VSFullScreenActionAlertViewController *result;

  v4 = a4;
  result = (_TtC12AutoSettings37VSFullScreenActionAlertViewController *)_swift_stdlib_reportUnimplementedInitializer("AutoSettings.VSFullScreenActionAlertViewController", 50, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000CDA0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action), *(_QWORD *)&self->action[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton));
}

@end
