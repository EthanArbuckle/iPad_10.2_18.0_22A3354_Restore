@implementation ATXNumericFeatureTimeSine

- (ATXNumericFeatureTimeSine)init
{
  return -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", &unk_1E83D0778);
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "timeContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = v5;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getHour:minute:second:nanosecond:fromDate:", &v14, &v13, &v12, 0, v7);

  v9 = 3600 * v14 + 60 * v13 + v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)sin((double)v9 * 6.28318531 / 86400.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
