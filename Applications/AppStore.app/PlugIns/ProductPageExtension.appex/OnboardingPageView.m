@implementation OnboardingPageView

- (_TtC20ProductPageExtension18OnboardingPageView)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension18OnboardingPageView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18OnboardingPageView_contentView) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtension18OnboardingPageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/OnboardingPageView.swift", 45, 2, 56, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension18OnboardingPageView *v2;

  v2 = self;
  sub_10047BECC();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4;
  CGFloat height;
  JUMeasurements result;

  v4 = 0.0;
  height = a3.height;
  result.var1 = a3.height;
  result.var0 = a3.width;
  result.var3 = v4;
  result.var2 = height;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension18OnboardingPageView *v6;

  v5 = a3;
  v6 = self;
  sub_10047C2E8(a3);

}

- (_TtC20ProductPageExtension18OnboardingPageView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension18OnboardingPageView *result;

  result = (_TtC20ProductPageExtension18OnboardingPageView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.OnboardingPageView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000975CC((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC20ProductPageExtension18OnboardingPageView_layoutMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18OnboardingPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18OnboardingPageView_contentScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18OnboardingPageView_trayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18OnboardingPageView_trayBackgroundView));
}

@end
