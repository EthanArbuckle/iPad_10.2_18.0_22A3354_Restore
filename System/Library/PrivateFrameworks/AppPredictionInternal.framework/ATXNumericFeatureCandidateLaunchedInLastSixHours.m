@implementation ATXNumericFeatureCandidateLaunchedInLastSixHours

- (ATXNumericFeatureCandidateLaunchedInLastSixHours)init
{
  return -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", &unk_1E83D0820);
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _BOOL8 v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "candidateIdentifiersLaunchAge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(v5, "timeContext"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "date"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend(v5, "timeContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v9);
    v15 = v14;

    v16 = v15 <= 21600.0 && v15 > 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &unk_1E83CE608;
  }

  return v17;
}

@end
