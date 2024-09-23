@implementation OverlayContentContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_1002C02CC(v4, x, y);

  return v4 & 1;
}

- (_TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView)initWithFrame:(CGRect)a3
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
  return -[OverlayContentContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[OverlayContentContainerView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
