@implementation HKSleepApneaEventInteractiveChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  unint64_t v6;
  HKSleepApneaEventInteractiveChartFormatter *v7;
  void *v8;

  sub_1D7AE309C();
  v6 = sub_1D7B4A4AC();
  v7 = self;
  sub_1D7AE2AC8(v6, a4);

  swift_bridgeObjectRelease();
  sub_1D7AAF6EC(0, &qword_1F014E7C0);
  v8 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v8;
}

- (HKSleepApneaEventInteractiveChartFormatter)initWithLocalizedCategoryName:(id)a3
{
  void *v4;
  HKSleepApneaEventInteractiveChartFormatter *v5;
  objc_super v7;

  sub_1D7B4A3BC();
  v4 = (void *)sub_1D7B4A38C();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SleepApneaEventInteractiveChartFormatter();
  v5 = -[HKInteractiveChartCategoryValueFormatter initWithLocalizedCategoryName:](&v7, sel_initWithLocalizedCategoryName_, v4);

  return v5;
}

@end
