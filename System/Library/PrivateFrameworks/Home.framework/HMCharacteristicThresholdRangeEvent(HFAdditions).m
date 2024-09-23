@implementation HMCharacteristicThresholdRangeEvent(HFAdditions)

- (uint64_t)hf_wouldFireForValue:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(a1, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hf_valueRoundedToNearestStepValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "thresholdRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "thresholdRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_valueRoundedToNearestStepValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "doubleValue");
    v14 = v13;
    objc_msgSend(v12, "doubleValue");
    v16 = v15 + -0.00000011920929;

    if (v14 < v16)
      goto LABEL_8;
  }
  objc_msgSend(a1, "thresholdRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "maxValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_6;
  objc_msgSend(a1, "thresholdRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "maxValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_valueRoundedToNearestStepValue:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v23 = v22;
  objc_msgSend(v21, "doubleValue");
  v25 = v24 + 0.00000011920929;

  if (v23 > v25)
LABEL_8:
    v26 = 0;
  else
LABEL_6:
    v26 = 1;

  return v26;
}

@end
