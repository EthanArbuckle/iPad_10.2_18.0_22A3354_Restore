@implementation ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_EEB742A6F4A819A60C1AA395BCD7BC6222PlaceholderOfferButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1002C64FC();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtCC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_EEB742A6F4A819A60C1AA395BCD7BC6222PlaceholderOfferButton *v2;

  v2 = self;
  sub_1002C58D4();

}

- (_TtCC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_EEB742A6F4A819A60C1AA395BCD7BC6222PlaceholderOfferButton)initWithFrame:(CGRect)a3
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
  return -[ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_EEB742A6F4A819A60C1AA395BCD7BC6222PlaceholderOfferButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
