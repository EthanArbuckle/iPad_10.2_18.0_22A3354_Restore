@implementation HeaderFooterTableView

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (_TtC5Media21HeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
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
  v10.super_class = (Class)type metadata accessor for HeaderFooterTableView();
  return -[HeaderFooterTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC5Media21HeaderFooterTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HeaderFooterTableView();
  return -[HeaderFooterTableView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
