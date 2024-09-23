@implementation PagingLayout

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout)init
{
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = -[UICollectionViewFlowLayout init](&v4, sel_init);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v2, sel_setMinimumLineSpacing_, 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v2, sel_setMinimumInteritemSpacing_, 0.0);
  -[UICollectionViewFlowLayout setSectionInset:](v2, sel_setSectionInset_, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[UICollectionViewFlowLayout setScrollDirection:](v2, sel_setScrollDirection_, 1);

  return v2;
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout)initWithCoder:(id)a3
{
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout *result;

  result = (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v7 = v11.receiver;
  v8 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_, x, y, width, height);
  objc_opt_self();
  v9 = (void *)swift_dynamicCastObjCClass();
  if (v9)
    objc_msgSend(v9, sel_setInvalidateFlowLayoutDelegateMetrics_, 1, v11.receiver, v11.super_class);

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout *v10;
  Class isa;
  id v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = type metadata accessor for IndexPath();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v14, sel_layoutAttributesForItemAtIndexPath_, isa);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = PagingLayout.layoutAttributesForElements(in:)(x, y, width, height);

  if (v8)
  {
    type metadata accessor for UICollectionViewLayoutAttributes();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

@end
