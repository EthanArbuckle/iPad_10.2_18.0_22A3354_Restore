@implementation ProductMediaCollectionViewCell

- (_TtC8AppStore30ProductMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30ProductMediaCollectionViewCell *)sub_1004A1868(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30ProductMediaCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004A4898();
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_compoundScrollObserver), "scrollViewDidScroll:", a3);
}

- (void)layoutSubviews
{
  _TtC8AppStore30ProductMediaCollectionViewCell *v2;

  v2 = self;
  sub_1004A1CC0();

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC8AppStore30ProductMediaCollectionViewCell *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1004A4A14();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore30ProductMediaCollectionViewCell *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1004A2968(v11);

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
  _TtC8AppStore30ProductMediaCollectionViewCell *v15;
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
  sub_1004A4AB4(v13);
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
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_1004A4DF4);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_1004A565C);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore30ProductMediaCollectionViewCell *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1004A2D18(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore30ProductMediaCollectionViewCell *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1004A582C(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore30ProductMediaCollectionViewCell *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1004A582C(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_compoundScrollObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_screenshotFetcher));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_media));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_pageTraits));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_topAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_bottomAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_topAccessoryDividerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_bottomAccessoryDividerView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_screenshotSelectionHandler), *(_QWORD *)&self->collectionView[OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_screenshotSelectionHandler]);
}

@end
