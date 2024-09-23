@implementation ScreenshotShelfCollectionViewCell

- (_TtC8AppStore33ScreenshotShelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33ScreenshotShelfCollectionViewCell *)sub_10040D9DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore33ScreenshotShelfCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_10040FEBC((uint64_t)v3, v4);
}

- (void)layoutSubviews
{
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v2;

  v2 = self;
  sub_10040DD70();

}

- (void)prepareForReuse
{
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v2;

  v2 = self;
  sub_10040E28C();

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10040FFDC();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10040E520(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1004100A8(v13);
  v17 = v16;
  v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1004102B8(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v17;
  id v18;
  Swift::Bool v19;
  uint64_t v20;
  UIImage_optional v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for ScreenshotCollectionViewCell(0);
  v14 = *(void **)(*(_QWORD *)(swift_dynamicCastClassUnconditional(a4, v13, 0, 0, 0)
                             + OBJC_IVAR____TtC8AppStore28ScreenshotCollectionViewCell_borderedScreenshotView)
                 + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_artworkView);
  v15 = a3;
  v16 = a4;
  v17 = self;
  v18 = v14;
  v21.value.super.isa = 0;
  v21.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v21, v19);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10040E998(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10041054C(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore33ScreenshotShelfCollectionViewCell *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10041054C(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_itemLayoutContext);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_platform));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_flowLayout));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_screenshotFetcher));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_pageTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_topAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_bottomAccessoryView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_artwork));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_sizedArtwork));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_didSelectHandler), *(_QWORD *)&self->platform[OBJC_IVAR____TtC8AppStore33ScreenshotShelfCollectionViewCell_didSelectHandler]);
}

@end
