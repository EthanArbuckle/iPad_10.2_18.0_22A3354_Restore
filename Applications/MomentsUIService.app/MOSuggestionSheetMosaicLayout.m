@implementation MOSuggestionSheetMosaicLayout

- (void)prepareLayout
{
  _TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *v2;

  v2 = self;
  MOSuggestionSheetMosaicLayout.prepare()();

}

- (CGSize)collectionViewContentSize
{
  void (*v2)(void);
  _TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.isa) + 0x88);
  v3 = self;
  v2();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  _TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *v5;
  id v6;
  void *v7;
  BOOL v8;
  CGSize v10;
  CGSize v11;

  height = a3.size.height;
  width = a3.size.width;
  v5 = self;
  v6 = -[MOSuggestionSheetMosaicLayout collectionView](v5, "collectionView");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "bounds");
    v10.width = width;
    v10.height = height;
    v8 = CGSizeEqualToSize(v10, v11);

    return !v8;
  }
  else
  {

    return 0;
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(void);
  _TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id result;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.isa) + 0x70);
  v10 = self;
  v11 = v9();
  v12 = v11;
  if ((unint64_t)v11 >> 62)
  {
    if (v11 >= 0)
      v11 &= 0xFFFFFFFFFFFFFF8uLL;
    v13 = _CocoaArrayWrapper.endIndex.getter(v11);
  }
  else
  {
    v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v14 = swift_bridgeObjectRelease(v12);
  v15 = IndexPath.item.getter(v14);
  if (v15 >= v13)
  {

    v20 = 0;
    goto LABEL_10;
  }
  v16 = IndexPath.item.getter(v15);
  result = (id)v9();
  v18 = result;
  if (((unint64_t)result & 0xC000000000000001) != 0)
  {
    v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, result);
    goto LABEL_8;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v16 < *(_QWORD *)(((unint64_t)result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v19 = *((id *)result + v16 + 4);
LABEL_8:
    v20 = v19;

    swift_bridgeObjectRelease(v18);
LABEL_10:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v20;
  }
  __break(1u);
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  MOSuggestionSheetMosaicLayout.layoutAttributesForElements(in:)(x, y, width, height);
  v9 = v8;

  if (v9)
  {
    type metadata accessor for UICollectionViewLayoutAttributes();
    v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10.super.isa = 0;
  }
  return v10.super.isa;
}

- (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout)init
{
  _OWORD *v3;
  char *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_contentBounds);
  *v3 = 0u;
  v3[1] = 0u;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_isFullHeight) = 1;
  v4 = (char *)self + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_mosaicSegmentDelegate;
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetMosaicLayout();
  return -[MOSuggestionSheetMosaicLayout init](&v6, "init");
}

- (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout)initWithCoder:(id)a3
{
  return (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *)MOSuggestionSheetMosaicLayout.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_cachedAttributes));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_mosaicSegmentDelegate);
}

@end
