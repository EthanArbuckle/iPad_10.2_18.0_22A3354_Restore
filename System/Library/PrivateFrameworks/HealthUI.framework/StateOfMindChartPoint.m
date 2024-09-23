@implementation StateOfMindChartPoint

- (_TtC8HealthUI21StateOfMindChartPoint)init
{
  _TtC8HealthUI21StateOfMindChartPoint *result;

  result = (_TtC8HealthUI21StateOfMindChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI21StateOfMindChartPoint_dateInterval;
  v4 = sub_1D7B48D78();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D7AA79D0((uint64_t)self + OBJC_IVAR____TtC8HealthUI21StateOfMindChartPoint____lazy_storage___dateIntervalMidpoint);
}

- (id)xValueAsGenericType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _TtC8HealthUI21StateOfMindChartPoint *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_1D7B49198();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v13 - v8;
  v10 = self;
  sub_1D7AA35DC((uint64_t)v9);

  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  v11 = (void *)sub_1D7B4A95C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v11;
}

- (id)minXValueAsGenericType
{
  id v1;
  id v2;
  void *v3;
  _QWORD v5[4];

  v1 = a1;
  v2 = objc_msgSend(v1, sel_xValueAsGenericType);
  sub_1D7B4A770();

  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_1D7B4A92C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (id)yValue
{
  _TtC8HealthUI21StateOfMindChartPoint *v2;
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
  if (-[StateOfMindChartPoint minYValue](v2, sel_minYValue))
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
  _TtC8HealthUI21StateOfMindChartPoint *v4;
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
  StateOfMindChartPoint.yValue(forKey:)(&v12);

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
  _TtC8HealthUI21StateOfMindChartPoint *v2;
  void *v3;

  v2 = self;
  StateOfMindChartPoint.allYValues()();

  v3 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minYValue
{
  return sub_1D7AA4300((uint64_t)self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))StateOfMindChartPoint.minYValue());
}

- (id)maxYValue
{
  return sub_1D7AA4300((uint64_t)self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))StateOfMindChartPoint.maxYValue());
}

- (id)userInfo
{
  _TtC8HealthUI21StateOfMindChartPoint *v2;
  id v3;

  v2 = self;
  v3 = StateOfMindChartPoint.userInfo()();

  return v3;
}

@end
