@implementation GuidedSearchTokenPaletteCollectionViewLayout

- (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout)init
{
  return (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *)sub_10036E96C();
}

- (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_layoutDelegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/GuidedSearchTokenPaletteCollectionViewLayout.swift", 59, 2, 33, 0);
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  uint64_t v2;

  v2 = type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout.LayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *v7;

  v5 = sub_100008FE4(0, &qword_10083F890, UICollectionViewUpdateItem_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10036EB0C(v6);

  swift_bridgeObjectRelease(v6);
}

- (void)finalizeCollectionViewUpdates
{
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8[24];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v2 = (char *)v9.receiver;
  -[GuidedSearchTokenPaletteCollectionViewLayout finalizeCollectionViewUpdates](&v9, "finalizeCollectionViewUpdates");
  v3 = &v2[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToSlideInAppearAnimate];
  swift_beginAccess(&v2[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToSlideInAppearAnimate], v8, 1, 0);
  v4 = *(_QWORD *)v3;
  *(_QWORD *)v3 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v4);
  v5 = &v2[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToFadeDisappearAnimate];
  swift_beginAccess(&v2[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToFadeDisappearAnimate], &v7, 1, 0);
  v6 = *(_QWORD *)v5;
  *(_QWORD *)v5 = _swiftEmptyArrayStorage;

  swift_bridgeObjectRelease(v6);
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return sub_10036F4C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_10036F1F4);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_10036F4C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_10036F368);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  NSArray v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v7 = v16.receiver;
  v8 = -[GuidedSearchTokenPaletteCollectionViewLayout layoutAttributesForElementsInRect:](&v16, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    v10 = sub_100008FE4(0, (unint64_t *)&qword_1008303D0, UICollectionViewLayoutAttributes_ptr);
    v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

    v12 = (char *)v7;
    v13 = sub_10036FE4C(v11, v12);
    swift_bridgeObjectRelease(v11);

    v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
  }
  else
  {

    v14.super.isa = 0;
  }
  return v14.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *v9;
  Class isa;
  objc_class *v11;
  _TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *v12;
  id v13;
  objc_super v15;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  v12 = (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *)-[GuidedSearchTokenPaletteCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v15, "layoutAttributesForItemAtIndexPath:", isa);

  if (v12)
  {
    v13 = sub_10036FB40(v12);

    v9 = v12;
  }
  else
  {
    v13 = 0;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BYTE *v7;
  char v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v7 = v10.receiver;
  if (-[GuidedSearchTokenPaletteCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v10, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height))
  {
    v8 = 1;
  }
  else
  {
    v8 = v7[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_pinningEnabled];
  }

  return v8;
}

- (void).cxx_destruct
{
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_layoutDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToSlideInAppearAnimate));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToFadeDisappearAnimate));
}

@end
