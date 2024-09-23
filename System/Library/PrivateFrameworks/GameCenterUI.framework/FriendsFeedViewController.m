@implementation FriendsFeedViewController

- (_TtC12GameCenterUI25FriendsFeedViewController)initWithCoder:(id)a3
{
  sub_1AB6778D4();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI25FriendsFeedViewController *v2;

  v2 = self;
  sub_1AB677938();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI25FriendsFeedViewController *v4;

  v4 = self;
  sub_1AB6779FC(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC12GameCenterUI25FriendsFeedViewController *v2;

  v2 = self;
  sub_1AB677A78();

}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  _TtC12GameCenterUI25FriendsFeedViewController *v2;
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
  sub_1AB677ADC((uint64_t)v2);
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
  _TtC12GameCenterUI25FriendsFeedViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB678184();
  v4 = v3;

  return v4;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12GameCenterUI25FriendsFeedViewController *v12;
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
  sub_1AB678A90(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC12GameCenterUI25FriendsFeedViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1AB678D00(v6, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25FriendsFeedViewController_activityFeedPresenter));
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI25FriendsFeedViewController *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB6790B0();

  swift_bridgeObjectRelease();
}

@end
