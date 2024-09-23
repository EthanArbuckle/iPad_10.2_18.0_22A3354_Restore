@implementation ScreenshotGalleryCollectionViewCell

- (_TtC22SubscribePageExtension35ScreenshotGalleryCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewCell(0);
  return -[ScreenshotCollectionViewCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end
