@implementation InformationRibbonCollectionViewCell

- (_TtC8AppStore35InformationRibbonCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC8AppStore35InformationRibbonCollectionViewCell *result;

  sub_10051C284();
  return result;
}

- (_TtC8AppStore35InformationRibbonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_10051C638((uint64_t)v3, v4);
}

- (void)layoutSubviews
{
  _TtC8AppStore35InformationRibbonCollectionViewCell *v2;

  v2 = self;
  sub_100519F78();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v7.receiver;
  -[InformationRibbonCollectionViewCell traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = &v5[OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_currentMinimumBadgeSizeCacheToken];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_10051C780);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_10051CC2C);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC8AppStore35InformationRibbonCollectionViewCell *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10051CE98();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore35InformationRibbonCollectionViewCell *v12;
  NSString v13;
  Class isa;
  id v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = String._bridgeToObjectiveC()();
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = objc_msgSend(v11, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, isa);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_badgeCollectionView));
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_minimumBadgeWidths));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_bottomSeparator));
  swift_release();
  swift_release();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_pageTraits));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore35InformationRibbonCollectionViewCell_nativelyRenderedBadges));
}

@end
