@implementation BaseJetCollectionViewController

- (id)dismissHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = sub_1AB5C8AE8();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_15_4;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI31BaseJetCollectionViewController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB48638C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AB5C8B34((uint64_t)v4, v5);

}

- (_TtC12GameCenterUI31BaseJetCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  BaseJetCollectionViewController.init(coder:)();
}

- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter
{
  id v2;

  sub_1AB5C8BD4();
  return (_TtC12GameCenterUI18BootstrapPresenter *)v2;
}

- (void)setBootstrapPresenter:(id)a3
{
  id v5;
  _TtC12GameCenterUI31BaseJetCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C8BFC((uint64_t)a3);

}

- (_TtC12GameCenterUI13BasePresenter)dataPresenter
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB5C9DB0();
  v4 = v3;

  return (_TtC12GameCenterUI13BasePresenter *)v4;
}

- (UICollectionViewCompositionalLayout)compositionalLayout
{
  id v2;

  sub_1AB5C8C20();
  return (UICollectionViewCompositionalLayout *)v2;
}

- (void)setCompositionalLayout:(id)a3
{
  id v5;
  _TtC12GameCenterUI31BaseJetCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C8C48((uint64_t)a3);

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

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v4;

  v4 = self;
  sub_1AB5CA290(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v3;

  v3 = self;
  sub_1AB5CA35C();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v4;

  v4 = self;
  sub_1AB5CA458(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v3;

  v3 = self;
  sub_1AB5CA56C();

}

- (void)viewDidLoad
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v2;

  v2 = self;
  sub_1AB5CA670();

}

- (void)didReceiveMemoryWarning
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v2;

  v2 = self;
  sub_1AB5CA75C();

}

- (id)makeLayout
{
  _TtC12GameCenterUI31BaseJetCollectionViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB5C8C70();
  v4 = v3;

  return v4;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB5CB800(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB5CAFF8);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI31BaseJetCollectionViewController *v11;
  uint64_t v13;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1AB5CB1B0();

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
  _TtC12GameCenterUI31BaseJetCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  sub_1AB5CB474();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB5CB800(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB5CB714);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12GameCenterUI31BaseJetCollectionViewController *v15;
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
  sub_1AB5CB8BC();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI31BaseJetCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5CBCA0(v4);

}

- (_TtC12GameCenterUI31BaseJetCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  BaseJetCollectionViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_bootstrapPresenter));
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_compositionalLayout));
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_diffableDataSource));
}

@end
