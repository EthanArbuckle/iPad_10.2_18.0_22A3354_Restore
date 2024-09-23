@implementation ATXCandidateRelevanceModelOneHotCategoricalFeaturizer

- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[ATXCandidateRelevanceModelOneHotCategoricalFeaturizer categoricalFeatureValueForContext:candidate:](self, "categoricalFeatureValueForContext:candidate:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

@end
