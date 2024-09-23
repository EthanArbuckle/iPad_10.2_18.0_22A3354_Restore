@implementation AMLRawSignalsConfiguration

- (NSString)bundleIdentifier
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F94D80);
}

- (void)setBundleIdentifier:(id)a3
{
  sub_235F948FC(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AMLRawSignalsConfiguration_bundleIdentifier);
}

- (NSString)modelName
{
  uint64_t v2;
  void *v3;

  sub_235F94DF4();
  if (v2)
  {
    v3 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setModelName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AMLRawSignalsConfiguration *v7;

  if (a3)
  {
    v4 = sub_235F9B3FC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_235F94E84(v4, v6);

}

- (NSString)versionId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F94E9C);
}

- (void)setVersionId:(id)a3
{
  sub_235F948FC(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AMLRawSignalsConfiguration_versionId);
}

- (int)expirationPolicy
{
  return sub_235F94EF4();
}

- (void)setExpirationPolicy:(int)a3
{
  sub_235F94F28(*(uint64_t *)&a3);
}

- (AMLFeaturesSpecification)rawSignalsDescription
{
  return (AMLFeaturesSpecification *)sub_235F94F58();
}

- (void)setRawSignalsDescription:(id)a3
{
  id v4;
  AMLRawSignalsConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_235F94FAC((uint64_t)v4);

}

- (NSString)configurationId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F94FC4);
}

- (AMLRawSignalsConfiguration)initWithBundleIdentifier:(id)a3 modelName:(id)a4 versionId:(id)a5 expirationPolicy:(int)a6 rawSignalsDescription:(id)a7
{
  id v9;
  AMLRawSignalsConfiguration *result;

  sub_235F9B3FC();
  if (a4)
    sub_235F9B3FC();
  sub_235F9B3FC();
  v9 = a7;
  AMLRawSignalsConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:rawSignalsDescription:)();
  return result;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))AMLRawSignalsConfiguration.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLRawSignalsConfiguration *v5;

  v4 = a3;
  v5 = self;
  AMLRawSignalsConfiguration.encode(with:)((NSCoder)v4);

}

- (AMLRawSignalsConfiguration)initWithCoder:(id)a3
{
  return (AMLRawSignalsConfiguration *)AMLRawSignalsConfiguration.init(coder:)(a3);
}

- (AMLRawSignalsConfiguration)init
{
  AMLRawSignalsConfiguration.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_77();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_235F884E8(self, (uint64_t)a2, (void (*)(void))AMLRawSignalsConfiguration.description.getter);
}

@end
