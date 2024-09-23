@implementation Feature

+ (BOOL)isDeviceActivityEnabled
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  swift_beginAccess();
  if (byte_1EF615C38 == 2)
  {
    v5 = &type metadata for Feature.FeatureFlags;
    v6 = sub_1C05F3AF8();
    v4[0] = 0;
    v2 = sub_1C0660DA8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    v2 = byte_1EF615C38 & 1;
  }
  return v2 & 1;
}

+ (BOOL)isDeviceActivityBiomeEnabled
{
  char v2;
  char v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  swift_beginAccess();
  if (byte_1EF615C39 == 2)
  {
    v5 = &type metadata for Feature.FeatureFlags;
    v6 = sub_1C05F3AF8();
    v4[0] = 1;
    v2 = sub_1C0660DA8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    v2 = byte_1EF615C39 & 1;
  }
  return v2 & 1;
}

+ (BOOL)isDeviceActivityUIEnabled
{
  char v2;
  char v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  swift_beginAccess();
  if (byte_1EF615C3A == 2)
  {
    v5 = &type metadata for Feature.FeatureFlags;
    v6 = sub_1C05F3AF8();
    v4[0] = 2;
    v2 = sub_1C0660DA8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    v2 = byte_1EF615C3A & 1;
  }
  return v2 & 1;
}

- (_TtC14DeviceActivity7Feature)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Feature();
  return -[Feature init](&v3, sel_init);
}

@end
