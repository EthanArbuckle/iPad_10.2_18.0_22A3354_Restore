@implementation SharedMedicationsChartDataSouce

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  int64_t var1;
  _TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *v6;
  _TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *v7;
  id v8;
  _OWORD v10[2];

  var1 = a3->var1;
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_2318D5FE8();
    v7 = (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_231877834((uint64_t)v7, var1);

  sub_2317CF774((uint64_t)v10, (uint64_t (*)(_QWORD))sub_2317E5F64);
  return v8;
}

- (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce)init
{
  _TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *result;

  result = (_TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2317CF774((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin31SharedMedicationsChartDataSouce_medication, type metadata accessor for SharedMedicationsFeedItemData);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
