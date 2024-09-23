@implementation TapbackPlatterCircleView

- (_TtC7ChatKit24TapbackPlatterCircleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7ChatKit24TapbackPlatterCircleView *v7;
  id v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TapbackPlatterCircleView();
  v7 = -[TapbackPlatterCircleView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  v8 = -[TapbackPlatterCircleView layer](v7, sel_layer);
  objc_msgSend(v8, sel_setAllowsEdgeAntialiasing_, 1);

  return v7;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TapbackPlatterCircleView();
  v2 = v9.receiver;
  -[TapbackPlatterCircleView layoutSubviews](&v9, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v9.receiver, v9.super_class);
  objc_msgSend(v2, sel_bounds);
  v5 = v4 * 0.5;
  v6 = objc_msgSend(v2, sel_traitCollection);
  objc_msgSend(v6, sel_displayScale);
  v8 = v7;

  objc_msgSend(v3, sel_setCornerRadius_, CGFloatPxRoundForScale(v5, v8));
}

- (_TtC7ChatKit24TapbackPlatterCircleView)initWithCoder:(id)a3
{
  _TtC7ChatKit24TapbackPlatterCircleView *result;

  result = (_TtC7ChatKit24TapbackPlatterCircleView *)sub_18E769320();
  __break(1u);
  return result;
}

@end
