@implementation DashboardSidebarViewController

- (_TtC12GameCenterUI30DashboardSidebarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  DashboardSidebarViewController.init(coder:)();
}

- (id)dismissHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = DashboardSidebarViewController.dismissHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_14;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI30DashboardSidebarViewController *v6;

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
  DashboardSidebarViewController.dismissHandler.setter((uint64_t)v4, v5);

}

- (BOOL)selectionFollowsFocus
{
  return sub_1AB4966F4() & 1;
}

- (void)setSelectionFollowsFocus:(BOOL)a3
{
  _BOOL8 v3;
  _TtC12GameCenterUI30DashboardSidebarViewController *v4;

  v3 = a3;
  v4 = self;
  sub_1AB496744(v3);

}

- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter
{
  id v2;

  sub_1AB49689C();
  return (_TtC12GameCenterUI18BootstrapPresenter *)v2;
}

- (void)setBootstrapPresenter:(id)a3
{
  id v5;
  _TtC12GameCenterUI30DashboardSidebarViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB49690C((uint64_t)a3);

}

- (_TtC12GameCenterUI25DashboardSidebarPresenter)sidebarPresenter
{
  return (_TtC12GameCenterUI25DashboardSidebarPresenter *)sub_1AB496938();
}

- (_TtC12GameCenterUI13BasePresenter)dataPresenter
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB496978();
  v4 = v3;

  return (_TtC12GameCenterUI13BasePresenter *)v4;
}

- (UICollectionViewCompositionalLayout)compositionalLayout
{
  id v2;

  sub_1AB4969CC();
  return (UICollectionViewCompositionalLayout *)v2;
}

- (void)setCompositionalLayout:(id)a3
{
  id v5;
  _TtC12GameCenterUI30DashboardSidebarViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB496A3C((uint64_t)a3);

}

- (void)viewDidLoad
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v2;

  v2 = self;
  DashboardSidebarViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v4;

  v4 = self;
  DashboardSidebarViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v4;

  v4 = self;
  DashboardSidebarViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v4;

  v4 = self;
  DashboardSidebarViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v4;

  v4 = self;
  DashboardSidebarViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v2;

  v2 = self;
  DashboardSidebarViewController.viewWillLayoutSubviews()();

}

- (void)updateBackgroundFor:(int64_t)a3
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v4;

  v4 = self;
  sub_1AB498674(a3);

}

- (id)makeLayout
{
  _TtC12GameCenterUI30DashboardSidebarViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB4991E0();
  v4 = v3;

  return v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB49B21C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))DashboardSidebarViewController.collectionView(_:willDisplay:forItemAt:));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB49B21C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))DashboardSidebarViewController.collectionView(_:didEndDisplaying:forItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI30DashboardSidebarViewController *v11;
  uint64_t v13;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = DashboardSidebarViewController.collectionView(_:shouldHighlightItemAt:)();

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
  _TtC12GameCenterUI30DashboardSidebarViewController *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  DashboardSidebarViewController.collectionView(_:didSelectItemAt:)();

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
  _TtC12GameCenterUI30DashboardSidebarViewController *v15;
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
  DashboardSidebarViewController.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC12GameCenterUI30DashboardSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  DashboardSidebarViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_85_0();
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_dismissHandler));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_bootstrapPresenter);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_sidebarPresenter);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_compositionalLayout);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_diffableDataSource);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_verticalSeparatorView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController____lazy_storage___sidebarProfileView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_focusGuide));
}

@end
