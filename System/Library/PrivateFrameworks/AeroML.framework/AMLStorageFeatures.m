@implementation AMLStorageFeatures

- (MLFeatureProvider)featureProvider
{
  return (MLFeatureProvider *)(id)sub_235F66514();
}

- (void)setFeatureProvider:(id)a3
{
  AMLStorageFeatures *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_235F6656C((uint64_t)a3);

}

- (MLBatchProvider)batchProvider
{
  return (MLBatchProvider *)(id)sub_235F66598();
}

- (void)setBatchProvider:(id)a3
{
  AMLStorageFeatures *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_235F665F0((uint64_t)a3);

}

- (MLArrayBatchProvider)arrayProvider
{
  return (MLArrayBatchProvider *)sub_235F6661C();
}

- (void)setArrayProvider:(id)a3
{
  id v5;
  AMLStorageFeatures *v6;

  v5 = a3;
  v6 = self;
  sub_235F66690((uint64_t)a3);

}

- (AMLStorageFeatures)initWithFeatureProvider:(id)a3 batchProvider:(id)a4 arrayProvider:(id)a5
{
  id v8;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = a5;
  return (AMLStorageFeatures *)AMLStorageFeatures.init(featureProvider:batchProvider:arrayProvider:)((uint64_t)a3, (uint64_t)a4, a5);
}

- (AMLStorageFeatures)init
{
  AMLStorageFeatures.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
