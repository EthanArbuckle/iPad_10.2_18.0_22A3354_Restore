@implementation MultiFeatureProvider

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  MultiFeatureProvider.featureNames.getter();
  swift_release();
  v2 = (void *)sub_21775E28C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;
  void *v7;

  v3 = sub_21775E1C0();
  v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  v7 = (void *)MultiFeatureProvider.featureValue(for:)(v6);
  swift_release();
  swift_bridgeObjectRelease();
  return v7;
}

@end
