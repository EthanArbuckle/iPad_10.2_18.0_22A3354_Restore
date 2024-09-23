@implementation HUQuickControlRangeViewController

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createInteractionCoordinator
{
  HUQuickControlSliderView *v3;
  void *v4;
  HUQuickControlSliderView *v5;
  HUQuickControlElasticSliderInteractionCoordinator *v6;

  v3 = [HUQuickControlSliderView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlSliderView initWithProfile:](v3, "initWithProfile:", v4);

  v6 = -[HUQuickControlElasticSliderInteractionCoordinator initWithControlView:delegate:]([HUQuickControlElasticSliderInteractionCoordinator alloc], "initWithControlView:delegate:", v5, self);
  return v6;
}

- (id)createViewProfile
{
  HUQuickControlSliderViewProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(HUQuickControlSliderViewProfile);
  -[HUQuickControlSliderViewProfile setHasOffState:](v3, "setHasOffState:", 0);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30880]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &unk_1E7041308;
  -[HUQuickControlSliderViewProfile setInteractionFidelity:](v3, "setInteractionFidelity:", objc_msgSend(v6, "unsignedIntegerValue"));

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "mode");
  if (v11 == 2)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minimumValueConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "maximumValueConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "validRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "validRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unionRange:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "percentageConstraintsWithinRange:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderViewProfile setPrimaryValueConstraints:](v3, "setPrimaryValueConstraints:", v20);

    objc_msgSend(v13, "percentageConstraintsWithinRange:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderViewProfile setSecondaryValueConstraints:](v3, "setSecondaryValueConstraints:", v21);

    -[HUQuickControlSliderViewProfile setHasSecondaryValue:](v3, "setHasSecondaryValue:", 1);
    goto LABEL_7;
  }
  if (v11 == 1)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetValueConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "validRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "percentageConstraintsWithinRange:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSliderViewProfile setPrimaryValueConstraints:](v3, "setPrimaryValueConstraints:", v15);
LABEL_7:

  }
  return v3;
}

- (id)controlToViewValueTransformer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id v12;
  id *v13;
  id *v14;
  id *v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "mode");
  v8 = (void *)MEMORY[0x1E0D319D8];
  v9 = objc_opt_class();
  v10 = MEMORY[0x1E0C809B0];
  if (v7 == 2)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke;
    v30[3] = &unk_1E6F58D18;
    v11 = &v31;
    v12 = v3;
    v31 = v12;
    v13 = &v32;
    v32 = v4;
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_2;
    v27[3] = &unk_1E6F58D40;
    v14 = &v28;
    v28 = v32;
    v15 = &v29;
    v29 = v12;
    v16 = v30;
    v17 = v27;
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_3;
    v24[3] = &unk_1E6F56220;
    v11 = &v25;
    v18 = v3;
    v25 = v18;
    v13 = &v26;
    v26 = v4;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_4;
    v21[3] = &unk_1E6F56248;
    v14 = &v22;
    v22 = v26;
    v15 = &v23;
    v23 = v18;
    v16 = v24;
    v17 = v21;
  }
  objc_msgSend(v8, "transformerForValueClass:transformBlock:reverseTransformBlock:", v9, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "primaryValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "maximumValueConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapValue:fromRange:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "secondaryValueConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "minimumValueConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "validRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mapValue:fromRange:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D315F0], "rangeWithMaxValue:minValue:", v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "minimumValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "secondaryValueConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapValue:fromRange:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "maximumValueConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "primaryValueConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "validRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mapValue:fromRange:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D316D0], "thresholdValueWithMinimumValue:maximumValue:", v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "primaryValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "targetValueConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapValue:fromRange:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __66__HUQuickControlRangeViewController_controlToViewValueTransformer__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "targetValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "primaryValueConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "validRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapValue:fromRange:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D316D0], "targetValueWithValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
