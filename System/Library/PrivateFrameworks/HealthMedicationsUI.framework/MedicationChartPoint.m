@implementation MedicationChartPoint

- (id)xValueAsGenericType
{
  _TtC19HealthMedicationsUI20MedicationChartPoint *v2;
  void *v3;
  uint64_t v5[4];

  v2 = self;
  sub_1BC18CEFC(v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_1BC2B53C0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (id)minXValueAsGenericType
{
  id v1;
  void *v2;
  uint64_t v4[4];

  v1 = a1;
  sub_1BC18CEFC(v4);

  __swift_project_boxed_opaque_existential_0(v4, v4[3]);
  v2 = (void *)sub_1BC2B53C0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2;
}

- (id)yValueForKey:(id)a3
{
  _TtC19HealthMedicationsUI20MedicationChartPoint *v3;
  double v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[4];

  v3 = self;
  if ((sub_1BC18C9E4() & 1) != 0)
    v4 = sub_1BC18CCF4();
  else
    v4 = *(double *)((char *)&v3->super.isa + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_takenCount)
       + *(double *)((char *)&v3->super.isa + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_skippedCount);
  v5 = MEMORY[0x1E0DEB070];
  v12[3] = MEMORY[0x1E0DEB070];
  *(double *)v12 = v4;

  v6 = __swift_project_boxed_opaque_existential_0(v12, v5);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1BC2B53C0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v10;
}

- (id)allYValues
{
  _TtC19HealthMedicationsUI20MedicationChartPoint *v2;
  void *v3;

  v2 = self;
  sub_1BC18D248();

  v3 = (void *)sub_1BC2B4580();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minYValue
{
  _TtC19HealthMedicationsUI20MedicationChartPoint *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  v2 = self;
  sub_1BC18D368((uint64_t)v10);

  v3 = v11;
  if (!v11)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_0(v10, v11);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)sub_1BC2B53C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v8;
}

- (id)yValue
{
  char *v1;
  double v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[4];

  v1 = a1;
  if ((sub_1BC18C9E4() & 1) != 0)
    v2 = sub_1BC18CCF4();
  else
    v2 = *(double *)&v1[OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_takenCount]
       + *(double *)&v1[OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_skippedCount];
  v3 = MEMORY[0x1E0DEB070];
  v10[3] = MEMORY[0x1E0DEB070];
  *(double *)v10 = v2;

  v4 = __swift_project_boxed_opaque_existential_0(v10, v3);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)sub_1BC2B53C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v8;
}

- (id)userInfo
{
  _TtC19HealthMedicationsUI20MedicationChartPoint *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC18D5A8();

  return v3;
}

- (_TtC19HealthMedicationsUI20MedicationChartPoint)init
{
  _TtC19HealthMedicationsUI20MedicationChartPoint *result;

  result = (_TtC19HealthMedicationsUI20MedicationChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_startDate;
  v4 = sub_1BC2B23F0();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_endDate, v4);
  v6 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_statisticsInterval;
  v7 = sub_1BC2B20FC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_medication);
}

@end
