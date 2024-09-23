@implementation TodayBrickShelfCollectionViewCell

- (_TtC8AppStore33TodayBrickShelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33TodayBrickShelfCollectionViewCell *)sub_1001F44D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore33TodayBrickShelfCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_1001F9ED4((uint64_t)v3, v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_compoundScrollObserver), "scrollViewDidScroll:", a3);
}

- (void)didMoveToWindow
{
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v2;

  v2 = self;
  sub_1001F4888();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  -[TodayBrickShelfCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_collectionView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  v5 = sub_10003D7F8();
  *(_QWORD *)&v6 = LayoutMarginsAware<>.layoutFrame.getter(v5).n128_u64[0];
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v2;

  v2 = self;
  sub_1001F3E9C();

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v10;
  id v11;
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v12;
  _BYTE v13[24];

  if (!*(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_pageTraits))
    return 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_todayCards);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_todayCards, v13, 0, 0);
  v7 = *v6;
  if (!((unint64_t)v7 >> 62))
    return *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7 < 0)
    v10 = v7;
  else
    v10 = v7 & 0xFFFFFFFFFFFFFF8;
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v10);

  swift_bridgeObjectRelease(v7);
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1001F4B74(v11);

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
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v15;
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
  sub_1001FA03C(v13);
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
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_1001FA218);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_1001FA4E0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  id v13;
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_didSelectHandler);
  if (v11)
  {
    v12 = *(_QWORD *)&self->artworkLoader[OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_didSelectHandler];
    v13 = a3;
    v14 = self;
    sub_10003A340((uint64_t)v11, v12);
    v16 = IndexPath.item.getter(v15);
    v11(v16);
    sub_10003A350((uint64_t)v11, v12);

  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1001FA67C(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore33TodayBrickShelfCollectionViewCell *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1001FA67C(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_compoundScrollObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_impressionsScrollObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_todayCards));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_objectGraph));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_didSelectHandler), *(_QWORD *)&self->artworkLoader[OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_didSelectHandler]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->artworkLoader[OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_impressionsUpdateBlock]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_impressionsCalculator);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_impressionsCoordinator));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore33TodayBrickShelfCollectionViewCell_pageTraits));
}

@end
