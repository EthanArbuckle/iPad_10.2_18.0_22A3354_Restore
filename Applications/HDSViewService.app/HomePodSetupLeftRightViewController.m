@implementation HomePodSetupLeftRightViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService35HomePodSetupLeftRightViewController *v2;

  v2 = self;
  sub_10005D180();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomePodSetupLeftRightViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupLeftRightViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService35HomePodSetupLeftRightViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_10006EB30();

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)leftButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC14HDSViewService35HomePodSetupLeftRightViewController *v6;

  v4 = a3;
  v6 = self;
  sub_10005E1FC((uint64_t)v6, v5);

}

- (void)rightButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC14HDSViewService35HomePodSetupLeftRightViewController *v6;

  v4 = a3;
  v6 = self;
  sub_10005E34C((uint64_t)v6, v5);

}

- (_TtC14HDSViewService35HomePodSetupLeftRightViewController)initWithContentView:(id)a3
{
  id v4;
  _TtC14HDSViewService35HomePodSetupLeftRightViewController *v5;

  v4 = a3;
  v5 = (_TtC14HDSViewService35HomePodSetupLeftRightViewController *)sub_10005E49C((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupLeftRightViewController_presenter]);

  sub_10001486C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupLeftRightViewController_viewModel]);
}

@end
