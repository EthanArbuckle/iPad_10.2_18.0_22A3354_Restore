@implementation HealthExperienceStoreCoreSpotlightDelegate

- (BOOL)usePrivateIndex
{
  return 1;
}

- (id)bundleIdentifier
{
  return (id)sub_1BC08A3B4();
}

- (id)indexName
{
  return (id)sub_1BC08A3B4();
}

- (id)protectionClass
{
  uint64_t v2;
  _TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate *v3;
  void *v4;

  v2 = qword_1ED69B758;
  v3 = self;
  if (v2 != -1)
    swift_once();
  swift_bridgeObjectRetain();

  v4 = (void *)sub_1BC08A3B4();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)attributeSetForObject:(id)a3
{
  id v4;
  _TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1BC024E80(v4);

  return v6;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_1BC02608C((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate__defaultsVersion;
  sub_1BC025844();
  v5 = v4;
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate__defaultsLocale, v5);
  v6((char *)self+ OBJC_IVAR____TtC18HealthPlatformCore42HealthExperienceStoreCoreSpotlightDelegate__defaultsStoreIdentifier, v5);
}

@end
