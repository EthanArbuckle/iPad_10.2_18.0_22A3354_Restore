@implementation StoreCollectionViewController

- (_TtC22SubscribePageExtension29StoreCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10052C070();
}

- (UICollectionView)collectionView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoreCollectionViewController();
  return -[StoreCollectionViewController collectionView](&v3, "collectionView");
}

- (void)setCollectionView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for StoreCollectionViewController();
  v4 = v12.receiver;
  v5 = a3;
  -[StoreCollectionViewController setCollectionView:](&v12, "setCollectionView:", v5);
  v6 = objc_msgSend(v4, "view", v12.receiver, v12.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = type metadata accessor for InsetCollectionViewControllerContentView();
    v9 = swift_dynamicCastClass(v7, v8);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v4, "collectionView");
      swift_unknownObjectWeakAssign(v10+ OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_collectionView, v11);

      return;
    }

  }
  __break(1u);
}

- (void)loadView
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052A4CC();

}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052A850();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_10052B6D8(a3, (SEL *)&selRef_viewWillAppear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_10052AB38(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_10052AD6C(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052B0DC();

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052B4D8((SEL *)&selRef_as_viewDidBecomeFullyVisible, &enum case for StoreViewControllerLifecycleEvent.didBecomeFullyVisible(_:));

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052B4D8((SEL *)&selRef_as_viewWillBecomePartiallyVisible, &enum case for StoreViewControllerLifecycleEvent.willBecomePartiallyVisible(_:));

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052B4D8((SEL *)&selRef_as_viewDidBecomePartiallyVisible, &enum case for StoreViewControllerLifecycleEvent.didBecomePartiallyVisible(_:));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_10052B6D8(a3, (SEL *)&selRef_viewDidDisappear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));

}

- (void)viewWillLayoutSubviews
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052B878();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[StoreCollectionViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)appEnteredWhileAppeared
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052A230();

}

- (void)appExitedWhileAppeared
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_10052A23C();

}

- (void)applicationDidBecomeActive:(id)a3
{
  _TtC22SubscribePageExtension29StoreCollectionViewController *v4;
  UICollectionView *v5;
  _TtC22SubscribePageExtension29StoreCollectionViewController *v6;
  _TtC22SubscribePageExtension29StoreCollectionViewController *v7;

  v4 = (_TtC22SubscribePageExtension29StoreCollectionViewController *)a3;
  v7 = self;
  v5 = -[StoreCollectionViewController collectionView](v7, "collectionView");
  if (v5)
  {
    v6 = (_TtC22SubscribePageExtension29StoreCollectionViewController *)v5;
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](v5, "selectItemAtIndexPath:animated:scrollPosition:", 0, 1, 0);

    v4 = v7;
    v7 = v6;
  }

}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC22SubscribePageExtension29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC22SubscribePageExtension29StoreCollectionViewController *result;

  v3 = a3;
  result = (_TtC22SubscribePageExtension29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.StoreCollectionViewController", 52, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension29StoreCollectionViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.StoreCollectionViewController", 52, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_objectGraph));
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_automationSemanticPageId]);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_lifecycleObserver, (uint64_t *)&unk_100802A10);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_statusBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_overlayViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_navigationAccessories));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_collectionViewDelegate));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension29StoreCollectionViewController_collectionViewDataSource));
}

@end
