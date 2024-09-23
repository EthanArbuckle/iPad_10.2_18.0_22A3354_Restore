@implementation StoreCollectionViewController

- (_TtC20ProductPageExtension29StoreCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100074CFC();
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
  id v9;
  __n128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StoreCollectionViewController();
  v4 = v11.receiver;
  v5 = a3;
  -[StoreCollectionViewController setCollectionView:](&v11, "setCollectionView:", v5);
  v6 = objc_msgSend(v4, "view", v11.receiver, v11.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = type metadata accessor for InsetCollectionViewControllerContentView();
    if (swift_dynamicCastClass(v7, v8))
    {
      v9 = objc_msgSend(v4, "collectionView");
      swift_unknownObjectWeakAssign(v10);

      return;
    }

  }
  __break(1u);
}

- (void)loadView
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100073180();

}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_1000734F8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_100074380(a3, (SEL *)&selRef_viewWillAppear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_1000737E0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_100073A14(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100073D84();

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100074180((SEL *)&selRef_as_viewDidBecomeFullyVisible, &enum case for StoreViewControllerLifecycleEvent.didBecomeFullyVisible(_:));

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100074180((SEL *)&selRef_as_viewWillBecomePartiallyVisible, &enum case for StoreViewControllerLifecycleEvent.willBecomePartiallyVisible(_:));

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100074180((SEL *)&selRef_as_viewDidBecomePartiallyVisible, &enum case for StoreViewControllerLifecycleEvent.didBecomePartiallyVisible(_:));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v4;

  v4 = self;
  sub_100074380(a3, (SEL *)&selRef_viewDidDisappear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));

}

- (void)viewWillLayoutSubviews
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100074520();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;
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
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100072EE4();

}

- (void)appExitedWhileAppeared
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v2;

  v2 = self;
  sub_100072EF0();

}

- (void)applicationDidBecomeActive:(id)a3
{
  _TtC20ProductPageExtension29StoreCollectionViewController *v4;
  UICollectionView *v5;
  _TtC20ProductPageExtension29StoreCollectionViewController *v6;
  _TtC20ProductPageExtension29StoreCollectionViewController *v7;

  v4 = (_TtC20ProductPageExtension29StoreCollectionViewController *)a3;
  v7 = self;
  v5 = -[StoreCollectionViewController collectionView](v7, "collectionView");
  if (v5)
  {
    v6 = (_TtC20ProductPageExtension29StoreCollectionViewController *)v5;
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

- (_TtC20ProductPageExtension29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC20ProductPageExtension29StoreCollectionViewController *result;

  v3 = a3;
  result = (_TtC20ProductPageExtension29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.StoreCollectionViewController", 50, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension29StoreCollectionViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.StoreCollectionViewController", 50, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_automationSemanticPageId]);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_lifecycleObserver, &qword_10080AFE0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_statusBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_navigationAccessories));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
