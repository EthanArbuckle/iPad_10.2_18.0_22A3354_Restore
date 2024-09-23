@implementation OnboardingTableViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI29OnboardingTableViewController *v2;

  v2 = self;
  sub_1A9730490();

}

- (void)viewDidLayoutSubviews
{
  _TtC18HealthExperienceUI29OnboardingTableViewController *v2;

  v2 = self;
  sub_1A97309A8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI29OnboardingTableViewController *v4;

  v4 = self;
  sub_1A9730A9C(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for OnboardingTableViewController();
  v4 = (char *)v6.receiver;
  v5 = a3;
  -[OnboardingTableViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v5);
  if (*(_QWORD *)&v4[OBJC_IVAR____TtC18HealthExperienceUI29OnboardingTableViewController_dataSourceAdaptor])
  {
    swift_retain();
    sub_1A9986ED4();

    swift_release();
  }
  else
  {

  }
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC18HealthExperienceUI29OnboardingTableViewController *result;

  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC18HealthExperienceUI29OnboardingTableViewController *result;

  v5 = a5;
  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC18HealthExperienceUI29OnboardingTableViewController *result;

  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC18HealthExperienceUI29OnboardingTableViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  UITableView *v6;
  _TtC18HealthExperienceUI29OnboardingTableViewController *v7;
  UIView_optional *v8;
  void *v9;
  void *v10;

  v6 = (UITableView *)a3;
  v7 = self;
  OnboardingTableViewController.tableView(_:viewForFooterInSection:)(v8, v6, a4);
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  UITableView *v6;
  _TtC18HealthExperienceUI29OnboardingTableViewController *v7;
  UIView_optional *v8;
  void *v9;
  void *v10;

  v6 = (UITableView *)a3;
  v7 = self;
  OnboardingTableViewController.tableView(_:viewForHeaderInSection:)(v8, v6, a4);
  v10 = v9;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC18HealthExperienceUI29OnboardingTableViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = OnboardingTableViewController.tableView(_:heightForHeaderInSection:)(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC18HealthExperienceUI29OnboardingTableViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = OnboardingTableViewController.tableView(_:heightForFooterInSection:)(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI29OnboardingTableViewController *v11;
  uint64_t v12;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  OnboardingTableViewController.tableView(_:didSelectRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
