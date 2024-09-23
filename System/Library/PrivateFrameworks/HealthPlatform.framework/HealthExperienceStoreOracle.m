@implementation HealthExperienceStoreOracle

- (_TtC14HealthPlatform27HealthExperienceStoreOracle)init
{
  _TtC14HealthPlatform27HealthExperienceStoreOracle *result;

  result = (_TtC14HealthPlatform27HealthExperienceStoreOracle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HealthPlatform27HealthExperienceStoreOracle_notificationCenter));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC14HealthPlatform27HealthExperienceStoreOracle_healthExperienceStore);
  swift_release();
}

- (NSString)description
{
  _TtC14HealthPlatform27HealthExperienceStoreOracle *v2;
  void *v3;

  v2 = self;
  HealthExperienceStoreOracle.description.getter();

  v3 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
