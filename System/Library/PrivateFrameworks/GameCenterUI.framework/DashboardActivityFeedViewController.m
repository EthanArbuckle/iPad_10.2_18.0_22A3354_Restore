@implementation DashboardActivityFeedViewController

- (_TtC12GameCenterUI35DashboardActivityFeedViewController)initWithCoder:(id)a3
{
  sub_1AB63A3BC();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v2;

  v2 = self;
  sub_1AB63A420();

}

- (void)viewWillLayoutSubviews
{
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v2;

  v2 = self;
  sub_1AB63A51C();

}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSDirectionalEdgeInsets result;

  v2 = self;
  sub_1AB63A580((uint64_t)v2);
  v4 = v3;
  v6 = v5;

  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  v10 = v6;
  result.trailing = v10;
  result.bottom = v8;
  result.leading = v9;
  result.top = v7;
  return result;
}

- (id)makeLayout
{
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB63AC2C();
  v4 = v3;

  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v3;

  v3 = self;
  sub_1AB63B80C();

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v14;
  uint64_t v15;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1AB63C0F0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = sub_1AB7D7D68();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v11 = a3;
  v12 = self;
  sub_1AB63C5B4();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1AB63C80C(v6, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35DashboardActivityFeedViewController_activityFeedPresenter));
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI35DashboardActivityFeedViewController *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB63CB94();

  swift_bridgeObjectRelease();
}

@end
