@implementation IconRoundButtonView

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IconRoundButtonView();
  v2 = v7.receiver;
  -[IconRoundButtonView layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  v4 = v3;
  objc_msgSend(v2, sel_bounds);
  if (v5 >= v4)
    v6 = v4;
  else
    v6 = v5;
  objc_msgSend(v2, sel__setContinuousCornerRadius_, v6 * 0.5);
  objc_msgSend(v2, sel_setNeedsDisplay);

}

- (CGSize)intrinsicContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for IconRoundButtonView();
  v2 = (char *)v11.receiver;
  -[IconRoundButtonView intrinsicContentSize](&v11, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  v7 = (double *)&v2[OBJC_IVAR____TtC6HomeUI19IconRoundButtonView_dimension];
  swift_beginAccess();
  v8 = *v7;

  if (v4 > v8)
    v9 = v4;
  else
    v9 = v8;
  if (v6 > v8)
    v10 = v6;
  else
    v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC6HomeUI19IconRoundButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC6HomeUI19IconRoundButtonView *)sub_1B8E4B7F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateConstraints
{
  _TtC6HomeUI19IconRoundButtonView *v2;

  v2 = self;
  sub_1B8E4C1AC();

}

- (_TtC6HomeUI19IconRoundButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9007B98();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

@end
