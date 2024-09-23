@implementation OnboardingTrayView

- (_TtC8AppStore18OnboardingTrayView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore18OnboardingTrayView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18OnboardingTrayView_itemViewLayoutItems) = (Class)_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC8AppStore18OnboardingTrayView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/OnboardingTrayView.swift", 33, 2, 29, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore18OnboardingTrayView *v2;

  v2 = self;
  sub_1005E2E5C();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC8AppStore18OnboardingTrayView *v8;
  __n128 v9;
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
  double v20;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9.n128_f64[0] = width;
  v10 = sub_1005E2FB4((uint64_t)a4, v9, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_unknownObjectRelease(a4);

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (_TtC8AppStore18OnboardingTrayView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore18OnboardingTrayView *result;

  result = (_TtC8AppStore18OnboardingTrayView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.OnboardingTrayView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore18OnboardingTrayView_itemViewLayoutItems));
  sub_1005E3604((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8AppStore18OnboardingTrayView_layoutMetrics));
}

@end
