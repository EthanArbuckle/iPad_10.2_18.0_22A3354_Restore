@implementation InAppPurchaseTiledLockupCollectionViewCell

- (void)tintColorDidChange
{
  _TtC8AppStore42InAppPurchaseTiledLockupCollectionViewCell *v2;

  v2 = self;
  sub_1002932F8();

}

- (_TtC8AppStore42InAppPurchaseTiledLockupCollectionViewCell)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[InAppPurchaseLockupCollectionViewCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end
