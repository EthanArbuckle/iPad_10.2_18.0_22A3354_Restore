@implementation SessionsViewController

- (_TtC13MediaControls22SessionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAAA2980();
}

- (void)loadView
{
  -[SessionsViewController setView:](self, sel_setView_, *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13MediaControls22SessionsViewController_sessionsView));
}

- (void)viewDidLoad
{
  _TtC13MediaControls22SessionsViewController *v2;

  v2 = self;
  sub_1AAAA0478();

}

- (void)dataSource:(id)a3 didUpdateBackdropImage:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  _TtC13MediaControls22SessionsViewController *v10;
  _BYTE v11[40];

  sub_1AAABA6F4();
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1AAAA3140(a4, (uint64_t)v11);

  sub_1AAAA310C((uint64_t)v11);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC13MediaControls22SessionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13MediaControls22SessionsViewController *result;

  v4 = a4;
  result = (_TtC13MediaControls22SessionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls22SessionsViewController_sessionsView));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls22SessionsViewController_backdropDataSource));
  swift_release();
  swift_release();
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls22SessionsViewController_dismissHandler));
}

@end
