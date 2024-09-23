@implementation NestedHorizontalShelfCollectionViewFlowLayout

- (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout)init
{
  _TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NestedHorizontalShelfCollectionViewFlowLayout();
  v2 = -[NestedHorizontalShelfCollectionViewFlowLayout init](&v4, "init");
  -[NestedHorizontalShelfCollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 1);
  return v2;
}

- (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout)initWithCoder:(id)a3
{
  _TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout *result;

  result = (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/NestedHorizontalShelfCollectionViewFlowLayout.swift", 60, 2, 25, 0);
  __break(1u);
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  _TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = self;
  sub_1005232D8(v7, v6, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

@end
