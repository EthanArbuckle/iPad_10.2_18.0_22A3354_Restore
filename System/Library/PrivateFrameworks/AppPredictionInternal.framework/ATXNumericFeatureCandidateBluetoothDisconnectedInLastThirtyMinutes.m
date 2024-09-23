@implementation ATXNumericFeatureCandidateBluetoothDisconnectedInLastThirtyMinutes

- (ATXNumericFeatureCandidateBluetoothDisconnectedInLastThirtyMinutes)init
{
  return -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", &unk_1E83D0898);
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
  uint64_t v12;
  _BOOL4 v14;
  _BOOL8 v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "bluetoothEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "timeContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = objc_msgSend(v5, "bluetoothState");
    v14 = v10 > 0.0 && v12 == 1;
    v15 = v10 <= 1800.0 && v14;
    objc_msgSend(v11, "numberWithInt:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &unk_1E83CE608;
  }

  return v16;
}

@end
