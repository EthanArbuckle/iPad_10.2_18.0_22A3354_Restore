@implementation FMR1InsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TtC11FMFindingUI14FMR1InsetLabel *v11;
  objc_super v12;

  v4 = sub_23AA26374(a3.origin.x);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  v11 = self;
  -[FMR1InsetLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  -[FMR1InsetLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  v6 = v5 + 8.0;
  v8 = v7 + 0.0;
  result.height = v8;
  result.width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  -[FMR1InsetLabel intrinsicContentSize](&v6, sel_intrinsicContentSize);
  v3 = v2 + 8.0;
  v5 = v4 + 0.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (_TtC11FMFindingUI14FMR1InsetLabel)initWithFrame:(CGRect)a3
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
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMR1InsetLabel_style) = xmmword_23AA3A820;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  return -[FMR1InsetLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11FMFindingUI14FMR1InsetLabel)initWithCoder:(id)a3
{
  objc_super v5;

  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMR1InsetLabel_style) = xmmword_23AA3A820;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMR1InsetLabel();
  return -[FMR1InsetLabel initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
