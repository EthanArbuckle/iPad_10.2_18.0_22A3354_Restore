@implementation OverlayContentContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC22SubscribePageExtensionP33_C7ACA0E60C18F74DCB977B6E66308C5727OverlayContentContainerView *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_100424034(v4, x, y);

  return v4 & 1;
}

- (_TtC22SubscribePageExtensionP33_C7ACA0E60C18F74DCB977B6E66308C5727OverlayContentContainerView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType();
  return -[OverlayContentContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtensionP33_C7ACA0E60C18F74DCB977B6E66308C5727OverlayContentContainerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[OverlayContentContainerView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
