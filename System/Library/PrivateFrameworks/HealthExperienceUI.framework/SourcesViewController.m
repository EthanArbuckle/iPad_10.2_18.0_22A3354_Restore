@implementation SourcesViewController

- (_TtC18HealthExperienceUI21SourcesViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI21SourcesViewController *result;

  result = (_TtC18HealthExperienceUI21SourcesViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI21SourcesViewController *v2;

  v2 = self;
  sub_1A96F7454();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI21SourcesViewController *v11;
  uint64_t v12;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  sub_1A96F812C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18HealthExperienceUI21SourcesViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI21SourcesViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI21SourcesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)viewControllerWillEnterAdaptiveModal
{
  _TtC18HealthExperienceUI21SourcesViewController *v2;

  v2 = self;
  SourcesViewController.viewControllerWillEnterAdaptiveModal()();

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  _TtC18HealthExperienceUI21SourcesViewController *v2;
  id v3;

  v2 = self;
  v3 = -[SourcesViewController navigationItem](v2, sel_navigationItem);
  objc_msgSend(v3, sel_setLeftBarButtonItem_, 0);

}

@end
