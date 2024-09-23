@implementation HKStateOfMindChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  unint64_t v6;
  HKStateOfMindChartFormatter *v7;
  void *v8;

  sub_1D7AE309C();
  v6 = sub_1D7B4A4AC();
  v7 = self;
  sub_1D7B207FC(v6, a4);

  swift_bridgeObjectRelease();
  sub_1D7AAF6EC(0, &qword_1F014E7C0);
  v8 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6;
  id v7;
  HKStateOfMindChartFormatter *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D7B21CA4(v7);

  v9 = (void *)sub_1D7B4A38C();
  swift_bridgeObjectRelease();
  return v9;
}

- (HKStateOfMindChartFormatter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StateOfMindChartFormatter();
  return -[HKStateOfMindChartFormatter init](&v3, sel_init);
}

@end
