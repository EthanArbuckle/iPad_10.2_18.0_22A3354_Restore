@implementation SettingsModelProvider

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v6;
  _TtC15HealthBalanceUI21SettingsModelProvider *v7;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_23DD0BFFC(v6, (uint64_t)v7);
  swift_unknownObjectRelease();

}

- (_TtC15HealthBalanceUI21SettingsModelProvider)init
{
  _TtC15HealthBalanceUI21SettingsModelProvider *result;

  result = (_TtC15HealthBalanceUI21SettingsModelProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15HealthBalanceUI21SettingsModelProvider___observationRegistrar;
  v4 = sub_23DDC5240();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
