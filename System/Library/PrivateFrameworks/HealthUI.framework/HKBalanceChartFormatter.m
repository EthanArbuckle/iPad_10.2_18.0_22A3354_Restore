@implementation HKBalanceChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  unint64_t v6;
  HKBalanceChartFormatter *v7;
  void *v8;

  sub_1D7AE309C();
  v6 = sub_1D7B4A4AC();
  v7 = self;
  sub_1D7B0C5F0(v6, a4);

  swift_bridgeObjectRelease();
  sub_1D7AAF6EC(0, &qword_1F014E7C0);
  v8 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v8;
}

- (HKBalanceChartFormatter)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___relativeStatFormatter) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___valueAttributes) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___unitAttributes) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BalanceChartFormatter();
  return -[HKBalanceChartFormatter init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___relativeStatFormatter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
