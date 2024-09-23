@implementation DateRangeRelevanceProvider

- (_TtC18HealthPlatformCore26DateRangeRelevanceProvider)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC18HealthPlatformCore26DateRangeRelevanceProvider *v9;
  objc_class *v10;
  _TtC18HealthPlatformCore26DateRangeRelevanceProvider *result;
  objc_super v12;

  v3 = sub_1BC089028();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1BC088E84();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1BC089838();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1BC08901C();
  sub_1BC088E60();
  sub_1BC089820();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v9 + OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval, v8, v5);

  v10 = (objc_class *)type metadata accessor for DateRangeRelevanceProvider();
  v12.receiver = v9;
  v12.super_class = v10;
  result = -[RERelevanceProvider init](&v12, sel_init);
  if (!result)
    __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _TtC18HealthPlatformCore26DateRangeRelevanceProvider *v4;
  _TtC18HealthPlatformCore26DateRangeRelevanceProvider *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC08A828();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1BC058110((uint64_t)v8);

  sub_1BC02593C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DateRangeRelevanceProvider();
  v2 = v6.receiver;
  v3 = -[RERelevanceProvider hash](&v6, sel_hash);
  v4 = sub_1BC08982C();

  return v4 ^ v3;
}

- (NSString)description
{
  _TtC18HealthPlatformCore26DateRangeRelevanceProvider *v2;
  void *v3;

  v2 = self;
  sub_1BC0586B0();

  v3 = (void *)sub_1BC08A3B4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC18HealthPlatformCore26DateRangeRelevanceProvider_relevantDateInterval;
  v3 = sub_1BC089838();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
