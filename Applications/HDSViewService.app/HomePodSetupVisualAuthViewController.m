@implementation HomePodSetupVisualAuthViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService36HomePodSetupVisualAuthViewController *v2;

  v2 = self;
  sub_1000606DC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14HDSViewService36HomePodSetupVisualAuthViewController *v4;

  v4 = self;
  sub_100060DB0(a3);

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupVisualAuthViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupVisualAuthViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService36HomePodSetupVisualAuthViewController_presenter]);
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

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC14HDSViewService36HomePodSetupVisualAuthViewController *v4;

  v4 = self;
  sub_1000613DC(a3);

}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)self + OBJC_IVAR____TtC14HDSViewService36HomePodSetupVisualAuthViewController_presenter);
  sub_10001486C((uint64_t)self + OBJC_IVAR____TtC14HDSViewService36HomePodSetupVisualAuthViewController_viewModel);
}

@end
