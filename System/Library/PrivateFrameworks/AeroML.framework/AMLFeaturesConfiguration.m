@implementation AMLFeaturesConfiguration

- (NSString)bundleIdentifier
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F86614);
}

- (NSString)modelName
{
  uint64_t v2;
  void *v3;

  sub_235F8667C();
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

- (NSString)versionId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F866AC);
}

- (int)expirationPolicy
{
  return sub_235F866F0();
}

- (AMLFeaturesSpecification)featuresDescription
{
  return (AMLFeaturesSpecification *)sub_235F86720();
}

- (NSString)configurationId
{
  return (NSString *)sub_235F6EFB8((uint64_t)self, (uint64_t)a2, sub_235F8673C);
}

- (AMLFeaturesConfiguration)initWithBundleIdentifier:(id)a3 modelName:(id)a4 versionId:(id)a5 expirationPolicy:(int)a6 featuresDescription:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AMLFeaturesConfiguration *result;

  v10 = sub_235F9B3FC();
  v12 = v11;
  if (a4)
  {
    a4 = (id)sub_235F9B3FC();
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = sub_235F9B3FC();
  AMLFeaturesConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:featuresDescription:)(v10, v12, (uint64_t)a4, v14, v15, v16, a6, (uint64_t)a7);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))AMLFeaturesConfiguration.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLFeaturesConfiguration *v5;

  v4 = a3;
  v5 = self;
  AMLFeaturesConfiguration.encode(with:)((NSCoder)v4);

}

- (AMLFeaturesConfiguration)initWithCoder:(id)a3
{
  return (AMLFeaturesConfiguration *)AMLFeaturesConfiguration.init(coder:)(a3);
}

- (AMLFeaturesConfiguration)init
{
  AMLFeaturesConfiguration.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_33_3();

  OUTLINED_FUNCTION_28_5();
}

- (NSString)description
{
  return (NSString *)sub_235F884E8(self, (uint64_t)a2, (void (*)(void))AMLFeaturesConfiguration.description.getter);
}

@end
