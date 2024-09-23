@implementation ATXCandidateRelevanceModel

- (float)predictForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  float result;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __break(1u);
  return result;
}

- (id)featureImportanceDescriptionForFeaturizationManager:(id)a3
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (id)featureImportancesForFeaturizationManager:(id)a3
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (id)featureContributionsDuringInferenceForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v7;
  id v8;
  id result;

  v7 = a3;
  v8 = a4;
  result = a5;
  __break(1u);
  return result;
}

- (id)featureContributionsDuringInferenceDescriptionForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v7;
  id v8;
  id result;

  v7 = a3;
  v8 = a4;
  result = a5;
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (ATXCandidateRelevanceModel)initWithCoder:(id)a3
{
  ATXCandidateRelevanceModel *result;

  result = (ATXCandidateRelevanceModel *)a3;
  __break(1u);
  return result;
}

@end
