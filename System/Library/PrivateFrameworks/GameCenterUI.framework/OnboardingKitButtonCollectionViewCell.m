@implementation OnboardingKitButtonCollectionViewCell

- (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell *)sub_1AB5CC27C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5CC43C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell *v8;
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
  v9 = sub_1AB5CC574((uint64_t)a4, width, height);
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB4941F0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell *v2;

  v2 = self;
  sub_1AB5CC6FC();

}

- (void)prepareForReuse
{
  _TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell *v2;

  v2 = self;
  sub_1AB5CC7CC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell_button));
}

@end
