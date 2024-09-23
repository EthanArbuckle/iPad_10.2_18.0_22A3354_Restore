@implementation FriendsListViewController

- (_TtC12GameCenterUI25FriendsListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB73169C();
}

- (_TtC12GameCenterUI13BasePresenter)dataPresenter
{
  return (_TtC12GameCenterUI13BasePresenter *)sub_1AB731750();
}

- (void)setDataPresenter:(id)a3
{
  id v4;
  _TtC12GameCenterUI25FriendsListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB7317A8(v4);

}

- (BOOL)isDeeplinked
{
  return sub_1AB7318A4() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  sub_1AB7318D8(a3);
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI25FriendsListViewController *v2;

  v2 = self;
  sub_1AB731938();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI25FriendsListViewController *v4;

  v4 = self;
  sub_1AB7319C4(a3);

}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = sub_1AB5CA268();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (id)makeLayout
{
  _TtC12GameCenterUI25FriendsListViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB7324C4();
  v4 = v3;

  return v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC12GameCenterUI25FriendsListViewController *v14;
  uint64_t v15;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1AB732C68();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC12GameCenterUI25FriendsListViewController *v14;
  uint64_t v15;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1AB7330FC((uint64_t)v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC12GameCenterUI25FriendsListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB7332AC(v4);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  _TtC12GameCenterUI25FriendsListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB733354();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25FriendsListViewController_friendsPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25FriendsListViewController_searchController));
}

@end
