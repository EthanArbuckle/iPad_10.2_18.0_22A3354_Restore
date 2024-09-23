@implementation NHOFeatureFlags

+ (BOOL)eagleRoostFeatureFlagIsEnabled
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &type metadata for NHOFeatureFlags;
  v6 = sub_24294EDE8();
  v2 = sub_242963944();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

- (NHOFeatureFlags)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NHOFeatureFlagsObjC();
  return -[NHOFeatureFlags init](&v3, sel_init);
}

@end
