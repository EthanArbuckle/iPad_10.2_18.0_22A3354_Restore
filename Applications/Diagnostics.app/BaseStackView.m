@implementation BaseStackView

- (_TtC11Diagnostics13BaseStackView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for BaseStackView();
  return -[BaseStackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11Diagnostics13BaseStackView)initWithCoder:(id)a3
{
  _TtC11Diagnostics13BaseStackView *result;

  result = (_TtC11Diagnostics13BaseStackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/BaseStackView.swift", 31, 2, 21, 0);
  __break(1u);
  return result;
}

@end
