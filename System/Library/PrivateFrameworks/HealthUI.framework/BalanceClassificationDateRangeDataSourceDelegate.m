@implementation BalanceClassificationDateRangeDataSourceDelegate

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  _TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  sub_1D7B1DEA0(v6, (void *)a4);

  sub_1D7ACBA64();
  v8 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate)init
{
  _TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate *result;

  result = (_TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate_applicationItems));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate_baseDisplayType));
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate_classification;
  v4 = sub_1D7B49588();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
