@implementation GameLayerAchievementsViewController

- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB77A45C();
}

- (NSArray)preferredFocusEnvironments
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v2;
  void *v3;

  v2 = self;
  GameLayerAchievementsViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC13090);
  v3 = (void *)sub_1AB7DB0E0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v2;

  v2 = self;
  GameLayerAchievementsViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v4;

  v4 = self;
  GameLayerAchievementsViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v4;

  v4 = self;
  GameLayerAchievementsViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v4;

  v4 = self;
  GameLayerAchievementsViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v4;

  v4 = self;
  GameLayerAchievementsViewController.viewDidDisappear(_:)(a3);

}

- (void)didReceiveMemoryWarning
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v2;

  v2 = self;
  GameLayerAchievementsViewController.didReceiveMemoryWarning()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v6;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  GameLayerAchievementsViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  GameLayerAchievementsViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)viewWillLayoutSubviews
{
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v2;

  v2 = self;
  GameLayerAchievementsViewController.viewWillLayoutSubviews()();

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v14;
  uint64_t v15;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  GameLayerAchievementsViewController.collectionView(_:willDisplay:forItemAt:)((uint64_t)v12, v13, (uint64_t)v11);

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
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v14;
  uint64_t v15;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  GameLayerAchievementsViewController.collectionView(_:didEndDisplaying:forItemAt:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  GameLayerAchievementsViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v12;
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
  GameLayerAchievementsViewController.collectionView(_:contextMenuConfigurationForItemAt:point:)();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  UICollectionView *v6;
  id v7;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v8;
  void *v9;

  v6 = (UICollectionView *)a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)GameLayerAchievementsViewController.collectionView(_:previewForDismissingContextMenuWithConfiguration:)(v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC12GameCenterUI35GameLayerAchievementsViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  GameLayerAchievementsViewController.scrollViewDidScroll(_:)(v4);

}

- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;

  v3 = a3;
  GameLayerAchievementsViewController.init(collectionViewLayout:)();
}

- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  GameLayerAchievementsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35GameLayerAchievementsViewController_bootstrapPresenter));
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  v2 = (void *)OUTLINED_FUNCTION_32_41(OBJC_IVAR____TtC12GameCenterUI35GameLayerAchievementsViewController_style);
  sub_1AB4C73EC(v2, v3, v4, v5, v6, v7, v8);
}

@end
