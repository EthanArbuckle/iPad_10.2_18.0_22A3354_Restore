@implementation HMCharacteristicThresholdRangeEvent

uint64_t __73__HMCharacteristicThresholdRangeEvent_HREAdditions__hre_triggeringValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL4 v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "doubleValue");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v7 > v10;

  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v3, "doubleValue");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "thresholdRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maxValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v15 < v18;

  }
  else
  {
    v19 = 1;
  }

  return v11 & v19;
}

@end
