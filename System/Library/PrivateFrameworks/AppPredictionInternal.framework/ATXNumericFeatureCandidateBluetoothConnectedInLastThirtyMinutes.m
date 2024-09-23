@implementation ATXNumericFeatureCandidateBluetoothConnectedInLastThirtyMinutes

- (ATXNumericFeatureCandidateBluetoothConnectedInLastThirtyMinutes)init
{
  return -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", &unk_1E83D0880);
}

- (id)numericFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  _BOOL8 v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "bluetoothEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "timeContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    objc_msgSend(v5, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (objc_msgSend(v5, "bluetoothState") == 1)
    {
      v17 = v15 >= 0.0 && v10 >= 0.0;
      v18 = v10 <= 1800.0 && v17;
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v16, "numberWithInt:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &unk_1E83CE608;
  }

  return v19;
}

@end
