@implementation _SNSoundPrintAFeatureEmbeddingCustomModel

- (_SNSoundPrintAFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  return (_SNSoundPrintAFeatureEmbeddingCustomModel *)sub_1D43B108C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t))sub_1D43B0C40);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1D43B179C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, id))sub_1D43B1140);
}

- (void).cxx_destruct
{
  sub_1D43A18E4();
  sub_1D43A18E4();
  sub_1D4334130();
}

@end
