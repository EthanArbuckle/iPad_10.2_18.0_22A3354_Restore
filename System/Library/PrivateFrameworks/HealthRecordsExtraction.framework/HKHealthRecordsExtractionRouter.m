@implementation HKHealthRecordsExtractionRouter

- (id)supportedResourceTypesForRelease:(id)a3
{
  id v4;
  HKHealthRecordsExtractionRouter *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_224E5C768();

  v6 = (void *)sub_224F67E80();
  swift_bridgeObjectRelease();
  return v6;
}

- (HKHealthRecordsExtractionRouter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HealthRecordsExtractionRouter();
  return -[HKHealthRecordsExtractionRouter init](&v3, sel_init);
}

@end
