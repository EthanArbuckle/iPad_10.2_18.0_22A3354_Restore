@implementation ATXNumericFeatureCandidateBluetoothConnected

- (ATXNumericFeatureCandidateBluetoothConnected)init
{
  return -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", &unk_1E83D0868);
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
  uint64_t v17;
  _BOOL4 v19;
  _BOOL8 v20;
  void *v21;

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
    v17 = objc_msgSend(v5, "bluetoothState");
    v19 = v10 >= 0.0 && v17 == 1;
    v20 = v15 >= 0.0 && v19;
    objc_msgSend(v16, "numberWithInt:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &unk_1E83CE608;
  }

  return v21;
}

@end
