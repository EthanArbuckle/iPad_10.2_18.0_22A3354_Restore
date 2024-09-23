@implementation DetectionLabel

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (_TtC16MagnifierSupport14DetectionLabel)initWithFrame:(CGRect)a3 textContainer:(id)a4
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
  return -[DetectionLabel initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC16MagnifierSupport14DetectionLabel)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[DetectionLabel initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
