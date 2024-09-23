@implementation BaseView

- (_TtC11Diagnostics8BaseView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC11Diagnostics8BaseView *v7;
  uint64_t (*v8)(void);
  _TtC11Diagnostics8BaseView *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BaseView();
  v7 = -[BaseView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v8 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.isa) + 0x50);
  v9 = v7;
  v10 = v8();
  v11 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v9->super.super.super.isa) + 0x58))(v10);
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v9->super.super.super.isa) + 0x60))(v11);

  return v9;
}

- (_TtC11Diagnostics8BaseView)initWithCoder:(id)a3
{
  _TtC11Diagnostics8BaseView *result;

  result = (_TtC11Diagnostics8BaseView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/BaseView.swift", 26, 2, 21, 0);
  __break(1u);
  return result;
}

@end
