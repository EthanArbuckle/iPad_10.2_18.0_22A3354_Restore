@implementation IntrinsicSizeAdjustingTableView

- (CGSize)intrinsicContentSize
{
  _TtC11Diagnostics31IntrinsicSizeAdjustingTableView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = self;
  -[IntrinsicSizeAdjustingTableView layoutIfNeeded](v2, "layoutIfNeeded");
  -[IntrinsicSizeAdjustingTableView contentSize](v2, "contentSize");
  v4 = v3;

  v5 = ceil(v4);
  v6 = UIViewNoIntrinsicMetric;
  result.height = v5;
  result.width = v6;
  return result;
}

- (_TtC11Diagnostics31IntrinsicSizeAdjustingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
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
  v10.super_class = (Class)type metadata accessor for IntrinsicSizeAdjustingTableView();
  return -[IntrinsicSizeAdjustingTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC11Diagnostics31IntrinsicSizeAdjustingTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IntrinsicSizeAdjustingTableView();
  return -[IntrinsicSizeAdjustingTableView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
