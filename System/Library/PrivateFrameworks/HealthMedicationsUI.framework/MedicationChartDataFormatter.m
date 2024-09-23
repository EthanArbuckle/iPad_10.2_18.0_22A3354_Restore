@implementation MedicationChartDataFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  unint64_t v6;
  _TtC19HealthMedicationsUI28MedicationChartDataFormatter *v7;
  void *v8;

  sub_1BC1933D0();
  v6 = sub_1BC2B458C();
  v7 = self;
  sub_1BC192434(v6, (uint64_t *)a4);

  swift_bridgeObjectRelease();
  sub_1BC0E1D38(0, (unint64_t *)&unk_1EF3FC970);
  v8 = (void *)sub_1BC2B4580();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC19HealthMedicationsUI28MedicationChartDataFormatter)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationChartDataFormatter____lazy_storage___numberFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicationChartDataFormatter();
  return -[MedicationChartDataFormatter init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationChartDataFormatter____lazy_storage___numberFormatter));
}

@end
