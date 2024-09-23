@implementation _SNVGGishFeatureEmbeddingCustomModel

- (_SNVGGishFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  sub_1D451A5CC();
  return (_SNVGGishFeatureEmbeddingCustomModel *)sub_1D4335C2C(a3);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  _SNVGGishFeatureEmbeddingCustomModel *v9;
  id v10;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = sub_1D4335DF8((uint64_t)a3, (uint64_t)v8);

  swift_unknownObjectRelease();
  return v10;
}

- (_SNVGGishFeatureEmbeddingCustomModel)init
{
  sub_1D43360C4();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
