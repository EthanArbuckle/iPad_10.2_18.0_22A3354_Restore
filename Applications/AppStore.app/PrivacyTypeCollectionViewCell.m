@implementation PrivacyTypeCollectionViewCell

- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29PrivacyTypeCollectionViewCell *)sub_1002FB328();
}

- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002FBC6C();
}

- (void)layoutSubviews
{
  _TtC8AppStore29PrivacyTypeCollectionViewCell *v2;

  v2 = self;
  sub_1002FA10C();

}

- (void)prepareForReuse
{
  _TtC8AppStore29PrivacyTypeCollectionViewCell *v2;

  v2 = self;
  sub_1002F8148();

}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _TtC8AppStore29PrivacyTypeCollectionViewCell *v9;
  _BYTE v11[24];

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryReusePool, v11, 33, 0);
  v9 = self;
  sub_10007B804(&qword_10083C4F0);
  ReusePool.drain()();
  swift_endAccess(v11);

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_detailLabel));
}

- (NSArray)accessibilityCategoryViews
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryViews, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for PrivacyCategoryView();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_detailLabel));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_shadowView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_artwork));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categories));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryReusePool;
  v4 = sub_10007B804(&qword_10083C4F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_style;
  v6 = type metadata accessor for PrivacyTypeStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_separatorView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_separator, (uint64_t *)&unk_10084CE60);
}

@end
