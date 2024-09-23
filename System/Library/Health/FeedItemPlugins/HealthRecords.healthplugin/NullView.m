@implementation NullView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC13HealthRecords8NullView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for NullView();
  return -[NullView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13HealthRecords8NullView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NullView();
  return -[NullView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
