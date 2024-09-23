@implementation RadioTopAlignedLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel *v7;
  id v8;
  objc_class *v9;
  objc_super v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = -[RadioTopAlignedLabel numberOfLines](v7, "numberOfLines");
  v9 = (objc_class *)type metadata accessor for RadioTopAlignedLabel();
  v11.receiver = v7;
  v11.super_class = v9;
  -[RadioTopAlignedLabel textRectForBounds:limitedToNumberOfLines:](&v11, "textRectForBounds:limitedToNumberOfLines:", v8, x, y, width, height);
  v10.receiver = v7;
  v10.super_class = v9;
  -[RadioTopAlignedLabel drawTextInRect:](&v10, "drawTextInRect:");

}

- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for RadioTopAlignedLabel();
  return -[RadioTopAlignedLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel)initWithCoder:(id)a3
{
  return (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel *)sub_10002DB24(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for RadioTopAlignedLabel);
}

@end
