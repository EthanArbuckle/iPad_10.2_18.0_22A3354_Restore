@implementation PaddingLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MagnifierSupport12PaddingLabel *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_2275263C0(x, y, width, height);

}

- (CGSize)intrinsicContentSize
{
  _TtC16MagnifierSupport12PaddingLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_2275264F8();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC16MagnifierSupport12PaddingLabel)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_topInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_bottomInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_leftInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_rightInset) = (Class)0x4014000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaddingLabel();
  return -[PaddingLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport12PaddingLabel)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_topInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_bottomInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_leftInset) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport12PaddingLabel_rightInset) = (Class)0x4014000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaddingLabel();
  return -[PaddingLabel initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
