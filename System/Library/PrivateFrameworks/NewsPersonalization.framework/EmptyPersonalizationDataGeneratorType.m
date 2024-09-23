@implementation EmptyPersonalizationDataGeneratorType

- (id)generateDerivedData
{
  _TtC19NewsPersonalization37EmptyPersonalizationDataGeneratorType *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  sub_1D5B7C4C4(MEMORY[0x1E0DEE9D8]);
  v3 = objc_allocWithZone(MEMORY[0x1E0D58AA8]);
  sub_1D5B4F74C(0, (unint64_t *)&qword_1ED9C0CD0);
  v4 = (void *)sub_1D5D1EDE8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithAggregates_scoringType_decayRate_, v4, 4, 0.0);

  return v5;
}

- (_TtC19NewsPersonalization37EmptyPersonalizationDataGeneratorType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[EmptyPersonalizationDataGeneratorType init](&v3, sel_init);
}

@end
