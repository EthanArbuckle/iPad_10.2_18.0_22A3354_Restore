@implementation AchievementsByGameViewController

- (_TtC12GameCenterUI32AchievementsByGameViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4BAA28();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI32AchievementsByGameViewController *v2;

  v2 = self;
  sub_1AB4BAB54();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI32AchievementsByGameViewController *v4;

  v4 = self;
  sub_1AB4BAC0C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI32AchievementsByGameViewController *v4;

  v4 = self;
  sub_1AB4BADA4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI32AchievementsByGameViewController *v4;

  v4 = self;
  sub_1AB4BAEEC(a3);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB4BCDD0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB4BC7D8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB4BCDD0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB4BCC24);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI32AchievementsByGameViewController *v11;
  uint64_t v13;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1AB4BCE80();

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
  _TtC12GameCenterUI32AchievementsByGameViewController *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  sub_1AB4BD114();

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
  _TtC12GameCenterUI32AchievementsByGameViewController *v15;
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
  sub_1AB4BD388();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC12GameCenterUI32AchievementsByGameViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  sub_1AB4BDF3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_bootstrapPresenter));
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_compositionalLayout);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_diffableDataSource);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_sortGamesBarButtonItem);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_navigationBarFocusGuide));
}

@end
