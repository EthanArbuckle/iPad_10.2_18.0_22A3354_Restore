@implementation LastSyncedDateFormatter

- (id)stringForObjectValue:(id)a3
{
  _TtC18HealthExperienceUI23LastSyncedDateFormatter *v4;
  _TtC18HealthExperienceUI23LastSyncedDateFormatter *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _OWORD v10[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A9A96670();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  sub_1A96F5A7C((uint64_t)v10);
  v7 = v6;

  sub_1A963C340((uint64_t)v10);
  if (!v7)
    return 0;
  v8 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC18HealthExperienceUI23LastSyncedDateFormatter)init
{
  objc_super v4;

  sub_1A9A92104();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LastSyncedDateFormatter();
  return -[LastSyncedDateFormatter init](&v4, sel_init);
}

- (_TtC18HealthExperienceUI23LastSyncedDateFormatter)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI23LastSyncedDateFormatter *v5;
  objc_super v7;

  v4 = a3;
  sub_1A9A92104();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LastSyncedDateFormatter();
  v5 = -[LastSyncedDateFormatter initWithCoder:](&v7, sel_initWithCoder_, v4);

  return v5;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23LastSyncedDateFormatter_calendar;
  v3 = sub_1A9A92128();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
