@implementation TitledAppIconView

- (_TtC12GameCenterUI17TitledAppIconView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17TitledAppIconView *)sub_1AB781E44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI17TitledAppIconView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB78207C();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI17TitledAppIconView *v2;

  v2 = self;
  sub_1AB7821A4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI17TitledAppIconView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB78241C();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI17TitledAppIconView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  JUMeasurements result;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AB782940(a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB7826C8();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17TitledAppIconView_titleLabel));
}

@end
