@implementation OnDevicePersonalizationDataContainer

- (NSDictionary)personalizationData
{
  void *v2;

  type metadata accessor for OnDevicePersonalizationData();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D892AC7C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSDictionary)metricsData
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D892AC7C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC19AppStoreKitInternal36OnDevicePersonalizationDataContainer)init
{
  _TtC19AppStoreKitInternal36OnDevicePersonalizationDataContainer *result;

  result = (_TtC19AppStoreKitInternal36OnDevicePersonalizationDataContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
