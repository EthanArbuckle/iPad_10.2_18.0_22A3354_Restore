@implementation MedicationChartDataSource

- (id)queryDescription
{
  void *v2;
  _TtC19HealthMedicationsUI25MedicationChartDataSource *v3;
  id v4;
  id v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationChartDataSource_medication);
  v3 = self;
  v4 = objc_msgSend(v2, sel_semanticIdentifier);
  v5 = objc_msgSend(v4, sel_stringValue);

  sub_1BC2B4460();
  v6 = (void *)sub_1BC2B4430();
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC19HealthMedicationsUI25MedicationChartDataSource *v8;
  void *v9;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1BC28437C(v7, (char *)v8, (void (**)(const void *, uint64_t, void *))v6);
  _Block_release(v6);
  _Block_release(v6);

  sub_1BC0E1D38(0, &qword_1EDA0E9E8);
  v9 = (void *)sub_1BC2B4580();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC19HealthMedicationsUI25MedicationChartDataSource *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1BC2813D8(v10, v11, (uint64_t)sub_1BC285AB4, v9);
  v14 = v13;

  swift_release();
  v17[4] = sub_1BC284374;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1BC1AEAE4;
  v17[3] = &block_descriptor_28_0;
  v15 = _Block_copy(v17);
  swift_release();
  return v15;
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  _TtC19HealthMedicationsUI25MedicationChartDataSource *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1BC284D90(v5);

  return v7;
}

- (_TtC19HealthMedicationsUI25MedicationChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v5;
  id v6;
  _TtC19HealthMedicationsUI25MedicationChartDataSource *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC19HealthMedicationsUI25MedicationChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI25MedicationChartDataSource)init
{
  _TtC19HealthMedicationsUI25MedicationChartDataSource *result;

  result = (_TtC19HealthMedicationsUI25MedicationChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationChartDataSource_medication));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
