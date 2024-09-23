@implementation ShelfFooterSeparator

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 1.0;
  result.height = v3;
  return result;
}

- (_TtC8AppStore20ShelfFooterSeparator)initWithFrame:(CGRect)a3
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
  return -[ShelfFooterSeparator initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStore20ShelfFooterSeparator)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[ShelfFooterSeparator initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
