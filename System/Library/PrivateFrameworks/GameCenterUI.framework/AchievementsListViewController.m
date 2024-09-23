@implementation AchievementsListViewController

- (_TtC12GameCenterUI30AchievementsListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB75F66C();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI30AchievementsListViewController *v2;

  v2 = self;
  sub_1AB75F860();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI30AchievementsListViewController *v4;

  v4 = self;
  sub_1AB760524(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI30AchievementsListViewController *v2;

  v2 = self;
  sub_1AB760694();

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB761EB4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB76198C);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB761EB4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB761D0C);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI30AchievementsListViewController *v11;
  uint64_t v13;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1AB761F5C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI30AchievementsListViewController *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  sub_1AB762200();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12GameCenterUI30AchievementsListViewController *v15;
  uint64_t v16;

  v9 = sub_1AB7D7D68();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7DAF90();
  sub_1AB7D7D14();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1AB7624A4();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12GameCenterUI30AchievementsListViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1AB76286C();

}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)sub_1AB7632DC(self, (uint64_t)a2, (void (*)(void))sub_1AB762CE8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI30AchievementsListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB762FB0();

}

- (_TtC12GameCenterUI30AchievementsListViewController)init
{
  sub_1AB763084();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_bootstrapPresenter));
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_gamesListCollectionView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_achievementsCollectionView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_gamesListDiffableDataSource);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_gamesListBackgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_loadingView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_emptyStateView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30AchievementsListViewController_showLoadingViewTimer));
}

@end
