@implementation SearchCollectionViewLayout

+ (Class)layoutAttributesClass
{
  uint64_t v2;

  v2 = type metadata accessor for SearchCollectionLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC20ProductPageExtension26SearchCollectionViewLayout)init
{
  return (_TtC20ProductPageExtension26SearchCollectionViewLayout *)sub_10015B508();
}

- (_TtC20ProductPageExtension26SearchCollectionViewLayout)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtension26SearchCollectionViewLayout *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_backgroundCornerRadius) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_pendingPrepareObserver);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension26SearchCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/SearchCollectionViewLayout.swift", 53, 2, 126, 0);
  __break(1u);
  return result;
}

- (CGSize)collectionViewContentSize
{
  _TtC20ProductPageExtension26SearchCollectionViewLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_10015B708();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double x;
  _TtC20ProductPageExtension26SearchCollectionViewLayout *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray v7;

  x = a3.origin.x;
  v4 = self;
  sub_10015B8BC(x);
  v6 = v5;

  if (v6)
  {
    sub_100018B6C(0, (unint64_t *)&qword_10080D920, UICollectionViewLayoutAttributes_ptr);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC20ProductPageExtension26SearchCollectionViewLayout *v9;
  Class isa;
  objc_class *v11;
  _TtC20ProductPageExtension26SearchCollectionViewLayout *v12;
  id v13;
  objc_super v15;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for SearchCollectionViewLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  v12 = (_TtC20ProductPageExtension26SearchCollectionViewLayout *)-[SearchCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v15, "layoutAttributesForItemAtIndexPath:", isa);

  if (v12)
  {
    v13 = sub_10015C37C(v12);

    v9 = v12;
  }
  else
  {
    v13 = 0;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC20ProductPageExtension26SearchCollectionViewLayout *v14;
  void *v15;
  __n128 v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  v15 = (void *)sub_10015C7D8(v11, v13, (uint64_t)v10);

  v16 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (void)prepareLayout
{
  _TtC20ProductPageExtension26SearchCollectionViewLayout *v2;

  v2 = self;
  sub_10015D544();

}

- (void).cxx_destruct
{
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_pendingPrepareObserver), *(_QWORD *)&self->backgroundCornerRadius[OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_pendingPrepareObserver]);
}

@end
