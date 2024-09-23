@implementation GalleryViewController

- (_TtC22SubscribePageExtension21GalleryViewController)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension21GalleryViewController *result;

  result = (_TtC22SubscribePageExtension21GalleryViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/GalleryViewController.swift", 50, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC22SubscribePageExtension21GalleryViewController *v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v2 = self;
  v3 = -[GalleryViewController navigationController](v2, "navigationController");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "barHideOnTapGestureRecognizer");

    objc_msgSend(v5, "removeTarget:action:", v2, 0);
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for GalleryViewController();
  -[GalleryViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artworkLoader));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artwork));
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1005F34F4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, 0);
}

- (void)as_viewWillBecomeFullyVisible
{
  sub_1005F3578(self, (uint64_t)a2, (const char **)&selRef_as_viewWillBecomeFullyVisible, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1005F34F4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, 1);
}

- (void)as_viewDidBecomePartiallyVisible
{
  sub_1005F3578(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomePartiallyVisible, 1);
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension21GalleryViewController *v2;

  v2 = self;
  sub_1005F35E4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension21GalleryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1005F38F0((uint64_t)a3);

}

- (BOOL)prefersStatusBarHidden
{
  _TtC22SubscribePageExtension21GalleryViewController *v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[GalleryViewController navigationController](v2, "navigationController");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "isNavigationBarHidden");

    LOBYTE(v3) = v5;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (void)tapStateChangedOn:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension21GalleryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005F3A70(v4);

}

- (void)dismissFrom:(id)a3
{
  -[GalleryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)swipeStateChangedOn:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension21GalleryViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3)
    -[GalleryViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC22SubscribePageExtension21GalleryViewController *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artwork);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artwork);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension21GalleryViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1005F3FD8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGSize result;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  objc_msgSend(a3, "frame");
  v12 = v11;
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  _TtC22SubscribePageExtension21GalleryViewController *v19;
  id v20;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for ArtworkCollectionViewCell(0);
  v14 = *(void **)(swift_dynamicCastClassUnconditional(a4, v13, 0, 0, 0)
                 + OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_artworkView);
  v15 = type metadata accessor for ArtworkView(0);
  v16 = sub_100059C5C();
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = v14;
  ArtworkLoader.forgetFetch<A>(forView:deprioritizingFetch:)(v20, 1, v15, v16);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension21GalleryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005F3CE8();

}

- (_TtC22SubscribePageExtension21GalleryViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC22SubscribePageExtension21GalleryViewController *result;

  v3 = a3;
  result = (_TtC22SubscribePageExtension21GalleryViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.GalleryViewController", 44, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension21GalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension21GalleryViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension21GalleryViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.GalleryViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
