@implementation SearchResultsCollectionCompositionalLayout

- (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject(&unk_100727B80, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *)sub_1000CE208((uint64_t)sub_1000CFD88, v6, a4);
}

- (CGSize)collectionViewContentSize
{
  _TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1000CE3D4();
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
  _TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray v7;

  x = a3.origin.x;
  v4 = self;
  sub_1000CE790(x);
  v6 = v5;

  if (v6)
  {
    sub_1000CFCE0();
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
  _TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *v9;
  Class isa;
  objc_class *v11;
  _TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *v12;
  id v13;
  objc_super v15;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for SearchResultsCollectionCompositionalLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  v12 = (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *)-[BaseCollectionCompositionalLayout layoutAttributesForItemAtIndexPath:](&v15, "layoutAttributesForItemAtIndexPath:", isa);

  if (v12)
  {
    v13 = sub_1000CF17C(v12);

    v9 = v12;
  }
  else
  {
    v13 = 0;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *v13;
  NSString v14;
  Class isa;
  objc_class *v16;
  id v17;
  id v18;
  __n128 v19;
  objc_super v21;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = self;
  v14 = String._bridgeToObjectiveC()();
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v16 = (objc_class *)type metadata accessor for SearchResultsCollectionCompositionalLayout();
  v21.receiver = v13;
  v21.super_class = v16;
  v17 = -[BaseCollectionCompositionalLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v21, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v14, isa);

  if (v17)
  {
    v18 = v17;
    v17 = sub_1000CF17C(v18);

    swift_bridgeObjectRelease(v12);
  }
  else
  {

    v19 = swift_bridgeObjectRelease(v12);
  }
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v19);
  return v17;
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
  _TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *v14;
  id v15;
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
  v15 = sub_1000CF4A8(v11, v13, (uint64_t)v10);

  v16 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

@end
