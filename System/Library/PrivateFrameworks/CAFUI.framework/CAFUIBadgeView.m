@implementation CAFUIBadgeView

- (_TtC5CAFUI14CAFUIBadgeView)initWithCoder:(id)a3
{
  id v4;
  _TtC5CAFUI14CAFUIBadgeView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5CAFUI14CAFUIBadgeView____lazy_storage___label) = 0;
  v4 = a3;

  result = (_TtC5CAFUI14CAFUIBadgeView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC5CAFUI14CAFUIBadgeView *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = self;
  v3 = CAFUIBadgeView.label.getter();
  objc_msgSend(v3, sel_intrinsicContentSize);
  v5 = v4;
  v7 = v6;

  if (one-time initialization token for badgePadding != -1)
    swift_once();
  v8 = *((double *)&static CAFUIBadgeView.badgePadding + 1);
  v9 = v5 + *(double *)&static CAFUIBadgeView.badgePadding;

  v10 = v7 + v8;
  v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC5CAFUI14CAFUIBadgeView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = CAFUIBadgeView.label.getter();
  objc_msgSend(v6, sel_sizeThatFits_, width, height);
  v8 = v7;
  v10 = v9;

  if (one-time initialization token for badgePadding != -1)
    swift_once();
  v11 = *((double *)&static CAFUIBadgeView.badgePadding + 1);
  v12 = v8 + *(double *)&static CAFUIBadgeView.badgePadding;

  v13 = v10 + v11;
  v14 = v12;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIBadgeView();
  v2 = v5.receiver;
  -[CAFUIBadgeView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);

}

- (_TtC5CAFUI14CAFUIBadgeView)initWithFrame:(CGRect)a3
{
  _TtC5CAFUI14CAFUIBadgeView *result;

  result = (_TtC5CAFUI14CAFUIBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI14CAFUIBadgeView____lazy_storage___label));
}

@end
