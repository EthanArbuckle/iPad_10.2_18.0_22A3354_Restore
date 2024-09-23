@implementation HomePodSetupPersonalRequestsViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService42HomePodSetupPersonalRequestsViewController *v2;

  v2 = self;
  sub_1000732D0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14HDSViewService42HomePodSetupPersonalRequestsViewController *v4;

  v4 = self;
  sub_1000746F4(a3);

}

- (_TtC14HDSViewService42HomePodSetupPersonalRequestsViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v5 = &self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_viewModel];
  v7 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_isConfigured] = 0;
  *(_QWORD *)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_bodyLabel] = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupPersonalRequestsViewController(0);
  return -[HomePodSetupPersonalRequestsViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_presenter]);
  sub_10001486C((uint64_t)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupPersonalRequestsViewController_viewModel]);

}

@end
