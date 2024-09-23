@implementation ATXNumericFeatureIsWeekend

- (ATXNumericFeatureIsWeekend)init
{
  return -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", &unk_1E83D07A8);
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "dateInWeekend"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
