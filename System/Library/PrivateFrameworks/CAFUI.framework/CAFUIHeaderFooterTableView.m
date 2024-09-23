@implementation CAFUIHeaderFooterTableView

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (_TtC5CAFUI26CAFUIHeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
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
  v10.super_class = (Class)type metadata accessor for CAFUIHeaderFooterTableView();
  return -[CAFUIHeaderFooterTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC5CAFUI26CAFUIHeaderFooterTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIHeaderFooterTableView();
  return -[CAFUIHeaderFooterTableView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
