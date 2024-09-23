@implementation MedicalRecordChartPoint

- (id)userInfo
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_blockCoordinateInfo));
}

- (id)xValueAsGenericType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC15HealthRecordsUI23MedicalRecordChartPoint *v11;
  id v12;
  void *v13;
  uint64_t v15;

  v3 = sub_1BC62A760();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - v8;
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_chartableSet);
  v11 = self;
  v12 = objc_msgSend(v10, sel_date);
  sub_1BC62A724();

  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  v13 = (void *)sub_1BC62D5D4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v13;
}

- (id)maxXValueAsGenericType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v2 = sub_1BC62A760();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - v7;
  v9 = *(void **)&a1[OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_chartableSet];
  v10 = a1;
  v11 = objc_msgSend(v9, sel_date);
  sub_1BC62A724();

  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  v12 = (void *)sub_1BC62D5D4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v12;
}

- (id)yValueForKey:(id)a3
{
  _TtC15HealthRecordsUI23MedicalRecordChartPoint *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  sub_1BC62C680();
  v4 = self;
  sub_1BC4C68FC((uint64_t)v13);

  swift_bridgeObjectRelease();
  v5 = v14;
  if (!v14)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1Tm(v13, v14);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v7 + 16))(v10, v8);
  v11 = (void *)sub_1BC62D568();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  return v11;
}

- (id)allYValues
{
  uint64_t v2;
  _TtC15HealthRecordsUI23MedicalRecordChartPoint *v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_sortedYValues);
  v3 = self;
  sub_1BC3D2678(v2);

  v4 = (void *)sub_1BC62C86C();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)yValue
{
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_sortedYValues) + 16))
    v1 = (void *)sub_1BC62D568();
  else
    v1 = 0;
  return v1;
}

- (id)maxYValue
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  sub_1BC4C6C0C((uint64_t)v10);
  v2 = v11;
  if (!v11)
    return 0;
  v3 = __swift_project_boxed_opaque_existential_1Tm(v10, v11);
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v4 + 16))(v7, v5);
  v8 = (void *)sub_1BC62D568();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  return v8;
}

- (NSString)description
{
  _TtC15HealthRecordsUI23MedicalRecordChartPoint *v2;
  void *v3;

  v2 = self;
  sub_1BC4C6D68();

  v3 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15HealthRecordsUI23MedicalRecordChartPoint)init
{
  _TtC15HealthRecordsUI23MedicalRecordChartPoint *result;

  result = (_TtC15HealthRecordsUI23MedicalRecordChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_blockCoordinateInfo));
  swift_bridgeObjectRelease();
}

@end
