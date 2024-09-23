@implementation AMLFeaturesSpecification

- (NSArray)featuresDescription
{
  void *v2;

  sub_235F872C0();
  sub_235F727D4(0, &qword_256399650);
  v2 = (void *)sub_235F9B444();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setFeaturesDescription:(id)a3
{
  uint64_t v4;
  AMLFeaturesSpecification *v5;

  sub_235F727D4(0, &qword_256399650);
  v4 = sub_235F9B450();
  v5 = self;
  sub_235F87338(v4);

}

- (AMLFeaturesSpecification)initWithFeaturesDescription:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_235F727D4(0, &qword_256399650);
  v3 = sub_235F9B450();
  return (AMLFeaturesSpecification *)AMLFeaturesSpecification.init(featuresDescription:)(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (AMLFeaturesSpecification)initWithFeatureDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_235F9B3CC();
  return (AMLFeaturesSpecification *)AMLFeaturesSpecification.init(featureDictionary:)(v3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_235F8774C);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLFeaturesSpecification *v5;

  v4 = a3;
  v5 = self;
  sub_235F87840(v4);

}

- (AMLFeaturesSpecification)initWithCoder:(id)a3
{
  return (AMLFeaturesSpecification *)AMLFeaturesSpecification.init(coder:)(a3);
}

- (AMLFeaturesSpecification)init
{
  AMLFeaturesSpecification.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_235F884E8(self, (uint64_t)a2, (void (*)(void))AMLFeaturesSpecification.description.getter);
}

@end
