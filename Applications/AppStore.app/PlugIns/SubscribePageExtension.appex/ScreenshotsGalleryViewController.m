@implementation ScreenshotsGalleryViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v4;

  v4 = self;
  sub_1001672DC(a3);

}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v2;

  v2 = self;
  sub_1001674B8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100167980((uint64_t)a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100167A9C(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)dismissFrom:(id)a3
{
  -[ScreenshotsGalleryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)swipeStateChangedOn:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3)
    -[ScreenshotsGalleryViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_artworks);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_artworks);
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
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100167ED4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100168B9C(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = IndexPath.item.getter();
  v14 = OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_selectedIndex;
  if ((Class)v13 != *(Class *)((char *)&v12->super.super.super.super.super.isa
                              + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_selectedIndex))
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v11, "scrollToItemAtIndexPath:atScrollPosition:animated:", isa, 16, 1);

    *(Class *)((char *)&v12->super.super.super.super.super.isa + v14) = (Class)IndexPath.item.getter();
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100168F30(v7, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_1001691F8(v13);
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return sub_1001683D8(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_setMinimumInteritemSpacing_);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return sub_1001683D8(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_setMinimumLineSpacing_);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension32ScreenshotsGalleryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100168498(v4);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_platform));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_artworks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_placeholderImages));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_fullScreenshotFetcher));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ScreenshotsGalleryViewController_galleryLayout));
}

@end
