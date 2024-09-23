@implementation BalanceChartPoint

- (_TtC8HealthUI17BalanceChartPoint)init
{
  _TtC8HealthUI17BalanceChartPoint *result;

  result = (_TtC8HealthUI17BalanceChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC8HealthUI17BalanceChartPoint_collection);
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI17BalanceChartPoint_date;
  v4 = sub_1D7B49198();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)xValueAsGenericType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = sub_1D7B49198();
  MEMORY[0x1E0C80A78](v3);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC8HealthUI17BalanceChartPoint_date, v3);
  return (id)sub_1D7B4A95C();
}

- (id)yValue
{
  _TtC8HealthUI17BalanceChartPoint *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _OWORD v10[2];
  _QWORD v11[3];
  uint64_t v12;

  v2 = self;
  if (-[BalanceChartPoint minYValue](v2, sel_minYValue))
  {
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_1D7AA7970((uint64_t)v10, (uint64_t)v11);

  v3 = v12;
  if (!v12)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_0(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)sub_1D7B4A92C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v8;
}

- (id)yValueForKey:(id)a3
{
  _TtC8HealthUI17BalanceChartPoint *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  sub_1D7B4A3BC();
  v4 = self;
  sub_1D7AC2508(&v12);

  swift_bridgeObjectRelease();
  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_0(&v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1D7B4A92C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v12);
  return v10;
}

- (id)allYValues
{
  _TtC8HealthUI17BalanceChartPoint *v2;
  void *v3;

  v2 = self;
  sub_1D7AC27DC();

  v3 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minYValue
{
  _TtC8HealthUI17BalanceChartPoint *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[4];

  v2 = self;
  sub_1D7AC1B78();
  v3 = MEMORY[0x1E0DEB070];
  v11[3] = MEMORY[0x1E0DEB070];
  v11[0] = v4;

  v5 = __swift_project_boxed_opaque_existential_0(v11, v3);
  v6 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  v9 = (void *)sub_1D7B4A92C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (id)maxYValue
{
  _TtC8HealthUI17BalanceChartPoint *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[4];

  v2 = self;
  sub_1D7AC1B78();
  v3 = MEMORY[0x1E0DEB070];
  v11[3] = MEMORY[0x1E0DEB070];
  v11[0] = v4;

  v5 = __swift_project_boxed_opaque_existential_0(v11, v3);
  v6 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  v9 = (void *)sub_1D7B4A92C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (id)userInfo
{
  return 0;
}

@end
