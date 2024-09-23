@implementation ShelfDisplayingFlowLayout

- (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout)init
{
  return (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout *)sub_1004A87F4();
}

- (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension25ShelfDisplayingFlowLayout_multiColumnMinYBySection;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_10050CC40((uint64_t)_swiftEmptyArrayStorage);
  v6 = OBJC_IVAR____TtC20ProductPageExtension25ShelfDisplayingFlowLayout_multiColumnOrigins;
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_10050AFBC((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ShelfDisplayingFlowLayout.swift", 52, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  v2 = v3.receiver;
  -[ShelfDisplayingFlowLayout prepareLayout](&v3, "prepareLayout");
  sub_1004A7FAC();

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1004A89F4(x, y, width, height);
  v9 = v8;

  if (v9)
  {
    sub_100018B6C(0, (unint64_t *)&qword_10080D920, UICollectionViewLayoutAttributes_ptr);
    v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10.super.isa = 0;
  }
  return v10.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *v9;
  id v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_1004A8EA8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
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
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *v14;
  id v15;
  __n128 v16;
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *v17;
  NSString v18;
  Class isa;
  objc_class *v20;
  objc_super v22;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (v11 == 0xD00000000000001FLL && v13 == 0x80000001006A7620
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, 0xD00000000000001FLL, 0x80000001006A7620, 0) & 1) != 0)
  {
    v14 = self;
    v15 = sub_1004A7BA8(v11, v13);

    v16 = swift_bridgeObjectRelease(v13);
  }
  else
  {
    v17 = self;
    v18 = String._bridgeToObjectiveC()();
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v20 = (objc_class *)type metadata accessor for ShelfDisplayingFlowLayout();
    v22.receiver = v17;
    v22.super_class = v20;
    v15 = -[ShelfDisplayingFlowLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](&v22, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v18, isa);

    swift_bridgeObjectRelease(v13);
  }
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = -[ShelfDisplayingFlowLayout collectionView](v7, "collectionView");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "bounds");
    v11 = v10;
    v13 = v12;

    if (v11 != width)
      goto LABEL_7;
  }
  else
  {
    v13 = 0.0;
    if (width != 0.0)
    {
LABEL_7:

      return 1;
    }
  }
  if (v13 != height)
    goto LABEL_7;
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  v14 = -[ShelfDisplayingFlowLayout shouldInvalidateLayoutForBoundsChange:](&v16, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);

  return v14;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC20ProductPageExtension25ShelfDisplayingFlowLayout *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1004A9300(x, y, width, height);

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension25ShelfDisplayingFlowLayout_multiColumnMinYBySection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension25ShelfDisplayingFlowLayout_multiColumnOrigins));
}

@end
