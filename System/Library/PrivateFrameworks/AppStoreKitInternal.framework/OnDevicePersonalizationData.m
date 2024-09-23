@implementation OnDevicePersonalizationData

- (NSString)appId
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)userSegments
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D892B054();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC19AppStoreKitInternal27OnDevicePersonalizationData)init
{
  _TtC19AppStoreKitInternal27OnDevicePersonalizationData *result;

  result = (_TtC19AppStoreKitInternal27OnDevicePersonalizationData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
