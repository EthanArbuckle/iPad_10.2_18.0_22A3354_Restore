@implementation FAFamilyFeatureFlag

+ (id)megadomeAdoption
{
  if (qword_1EF990DA0 != -1)
    swift_once();
  return (id)qword_1EF991388;
}

- (FAFamilyFeatureFlag)initWithRawValue:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  FAFamilyFeatureFlag *v7;
  Swift::String v8;
  objc_super v10;
  char v11;

  v4 = sub_1CAF20400();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  FamilyFeatureFlags.init(rawValue:)(v8);
  *((_BYTE *)&v7->super.isa + OBJC_IVAR___FAFamilyFeatureFlag_swiftVariant) = v11;

  v10.receiver = v7;
  v10.super_class = (Class)FAFamilyFeatureFlag;
  return -[FAFamilyFeatureFlag init](&v10, sel_init);
}

- (BOOL)isEnabled
{
  FAFamilyFeatureFlag *v2;
  char v3;

  v2 = self;
  v3 = sub_1CAEF0714();

  return v3 & 1;
}

- (FAFamilyFeatureFlag)init
{
  FAFamilyFeatureFlag *result;

  result = (FAFamilyFeatureFlag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
