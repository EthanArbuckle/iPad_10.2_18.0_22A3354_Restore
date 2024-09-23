@implementation StackView

- (_TtC8AppStore9StackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore9StackView_distribution;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_axis) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_alignment) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_spacing) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StackView();
  return -[StackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStore9StackView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC8AppStore9StackView *result;

  v4 = (char *)self + OBJC_IVAR____TtC8AppStore9StackView_distribution;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_axis) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_alignment) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_spacing) = 0;
  v5 = a3;

  result = (_TtC8AppStore9StackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/StackView.swift", 24, 2, 20, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StackView();
  v2 = v3.receiver;
  -[StackView layoutSubviews](&v3, "layoutSubviews");
  sub_1001B3290();
  sub_1001B33F8();
  sub_1001B36A8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  _TtC8AppStore9StackView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9StackView_spacing);
  v6 = self;
  sub_1001B3AC4(width, height, v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSArray)accessibilityNonHiddenSubviews
{
  _TtC8AppStore9StackView *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  sub_1001B30C0();
  v4 = v3;

  sub_10003D7F8();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

@end
