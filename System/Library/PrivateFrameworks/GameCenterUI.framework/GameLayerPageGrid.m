@implementation GameLayerPageGrid

- (double)columnWidth
{
  return PageGrid.columnWidth.getter();
}

- (double)interColumnSpacing
{
  return PageGrid.interColumnSpacing.getter();
}

- (int64_t)columnCount
{
  return PageGrid.columnCount.getter();
}

- (UIEdgeInsets)minimumInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = PageGrid.minimumInsets.getter();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)centeringInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = PageGrid.centeringInsets.getter();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (GameLayerPageGrid)initWithContainerSize:(CGSize)a3 traitCollection:(id)a4
{
  return (GameLayerPageGrid *)PageGrid.init(containerSize:traitCollection:)((uint64_t)a4);
}

- (GameLayerPageGrid)initWithSize:(CGSize)a3 traitCollection:(id)a4
{
  id v4;

  v4 = a4;
  return (GameLayerPageGrid *)PageGrid.init(size:traitCollection:)();
}

- (GameLayerPageGrid)initWithSize:(CGSize)a3 traitCollection:(id)a4 idealColumnSizeCategory:(int64_t)a5
{
  GameLayerPageGrid *result;

  PageGrid.init(size:traitCollection:idealColumnSizeCategory:)(a4);
  return result;
}

- (GameLayerPageGrid)initWithWidth:(double)a3 columnSizeCategory:(int64_t)a4 maxColumns:(id)a5
{
  int v6;
  id v7;
  GameLayerPageGrid *result;

  v6 = a4;
  v7 = a5;
  PageGrid.init(width:columnSizeCategory:maxColumns:)(v6, a5);
  return result;
}

- (GameLayerPageGrid)init
{
  PageGrid.init()();
}

- (void).cxx_destruct
{

}

@end
