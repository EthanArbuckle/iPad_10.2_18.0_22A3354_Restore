@implementation RangeView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[RangeView sizeThatFits:](self, sel_sizeThatFits_, 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC21VisionHealthAppPlugin9RangeView)initWithCoder:(id)a3
{
  id v4;
  _TtC21VisionHealthAppPlugin9RangeView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin9RangeView_minimumFractionDigits) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin9RangeView_maximumFractionDigits) = (Class)2;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC21VisionHealthAppPlugin9RangeView_showsPositivePrefix) = 0;
  v4 = a3;

  result = (_TtC21VisionHealthAppPlugin9RangeView *)sub_2322B9350();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RangeView();
  v2 = v3.receiver;
  -[RangeView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_setNeedsDisplay, v3.receiver, v3.super_class);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC21VisionHealthAppPlugin9RangeView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  _s21VisionHealthAppPlugin9RangeViewC12sizeThatFitsySo6CGSizeVAFF_0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC21VisionHealthAppPlugin9RangeView *v6;
  _TtC21VisionHealthAppPlugin9RangeView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  RangeView.traitCollectionDidChange(_:)(v8);

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC21VisionHealthAppPlugin9RangeView *v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  RangeView.draw(_:)(v8);

}

- (_TtC21VisionHealthAppPlugin9RangeView)initWithFrame:(CGRect)a3
{
  _TtC21VisionHealthAppPlugin9RangeView *result;

  result = (_TtC21VisionHealthAppPlugin9RangeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
