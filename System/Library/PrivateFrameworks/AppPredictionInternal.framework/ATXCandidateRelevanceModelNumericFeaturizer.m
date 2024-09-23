@implementation ATXCandidateRelevanceModelNumericFeaturizer

- (id)featureVectorForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[ATXCandidateRelevanceModelNumericFeaturizer numericFeatureValueForContext:candidate:](self, "numericFeatureValueForContext:candidate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)dimensions
{
  return 1;
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

@end
