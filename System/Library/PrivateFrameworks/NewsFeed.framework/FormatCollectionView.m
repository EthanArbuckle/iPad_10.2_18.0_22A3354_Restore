@implementation FormatCollectionView

- (_TtC8NewsFeed20FormatCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[FormatCollectionView initWithFrame:collectionViewLayout:](&v10, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC8NewsFeed20FormatCollectionView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[FormatCollectionView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
