@implementation RoundedTitledButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12GameCenterUI19RoundedTitledButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1AB755334(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)didTapButton:(id)a3
{
  id v4;
  _TtC12GameCenterUI19RoundedTitledButton *v5;

  v4 = a3;
  v5 = self;
  sub_1AB75548C();

}

- (double)_cornerRadius
{
  _TtC12GameCenterUI19RoundedTitledButton *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1AB755568();
  v4 = v3;

  return v4;
}

- (void)_setCornerRadius:(double)a3
{
  _TtC12GameCenterUI19RoundedTitledButton *v4;

  v4 = self;
  sub_1AB75527C(a3);

}

- (BOOL)isEnabled
{
  _TtC12GameCenterUI19RoundedTitledButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB7552C0();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _TtC12GameCenterUI19RoundedTitledButton *v4;

  v4 = self;
  sub_1AB7552F0(a3);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI19RoundedTitledButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1AB7557C0((uint64_t)a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease();

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI19RoundedTitledButton *v2;

  v2 = self;
  sub_1AB755924();

}

- (_TtC12GameCenterUI19RoundedTitledButton)initWithFrame:(CGRect)a3
{
  sub_1AB755A34();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI19RoundedTitledButton_height);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI19RoundedTitledButton_tapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19RoundedTitledButton_visualEffectView));
}

@end
