@implementation ArcadeWelcomeContentView

- (_TtC22SubscribePageExtension24ArcadeWelcomeContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24ArcadeWelcomeContentView *)sub_1002ECEA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24ArcadeWelcomeContentView)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension24ArcadeWelcomeContentView *result;

  result = (_TtC22SubscribePageExtension24ArcadeWelcomeContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ArcadeWelcomeContentView.swift", 53, 2, 70, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension24ArcadeWelcomeContentView *v2;

  v2 = self;
  sub_1002ED564();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension24ArcadeWelcomeContentView *v8;
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
  v10 = sub_1002ED7F4((uint64_t)a4, v9, height);
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

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension24ArcadeWelcomeContentView *v6;

  v5 = a3;
  v6 = self;
  sub_1002EDA9C((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ArcadeWelcomeContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ArcadeWelcomeContentView_subtitleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension24ArcadeWelcomeContentView_itemViews));
}

@end
