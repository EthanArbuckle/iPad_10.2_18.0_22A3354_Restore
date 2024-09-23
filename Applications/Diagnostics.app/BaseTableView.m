@implementation BaseTableView

- (_TtC11Diagnostics13BaseTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
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
  v10.super_class = (Class)type metadata accessor for BaseTableView();
  return -[BaseTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC11Diagnostics13BaseTableView)initWithCoder:(id)a3
{
  _TtC11Diagnostics13BaseTableView *result;

  result = (_TtC11Diagnostics13BaseTableView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/BaseTableView.swift", 31, 2, 21, 0);
  __break(1u);
  return result;
}

@end
