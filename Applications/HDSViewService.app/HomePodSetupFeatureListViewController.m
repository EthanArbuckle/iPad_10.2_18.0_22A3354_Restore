@implementation HomePodSetupFeatureListViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService37HomePodSetupFeatureListViewController *v2;

  v2 = self;
  sub_100053AB8();

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupFeatureListViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupFeatureListViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_presenter]);
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

- (_TtC14HDSViewService37HomePodSetupFeatureListViewController)initWithContentView:(id)a3
{
  id v4;
  _TtC14HDSViewService37HomePodSetupFeatureListViewController *v5;

  v4 = a3;
  v5 = (_TtC14HDSViewService37HomePodSetupFeatureListViewController *)sub_100054F3C((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_presenter]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_features]);

  sub_10001486C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupFeatureListViewController_viewModel]);
}

@end
