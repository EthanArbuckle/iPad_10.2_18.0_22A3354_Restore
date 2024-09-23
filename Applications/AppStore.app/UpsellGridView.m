@implementation UpsellGridView

- (_TtC8AppStore14UpsellGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003A3E3C();
}

- (void)layoutSubviews
{
  _TtC8AppStore14UpsellGridView *v2;

  v2 = self;
  sub_1003A239C();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC8AppStore14UpsellGridView *v8;
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
  v10 = sub_1003A3304((uint64_t)a4, v9, height);
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

- (id)impressionItems
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_amsImpressionItems);
  sub_1003A42B8();
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (_TtC8AppStore14UpsellGridView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore14UpsellGridView *result;

  result = (_TtC8AppStore14UpsellGridView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.UpsellGridView", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_primaryIcon));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore14UpsellGridView_remainingIcons));
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore14UpsellGridView_impressionsCalculator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore14UpsellGridView_iconViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore14UpsellGridView_amsImpressionItems));
}

@end
