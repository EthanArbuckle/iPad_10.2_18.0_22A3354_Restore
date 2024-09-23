@implementation HFValueTransformer

id __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "primaryValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "targetValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mapValue:fromRange:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "primaryValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapValue:fromRange:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D316D0], "targetValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "maximumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mapValue:fromRange:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "mapValue:fromRange:", v5, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D315F0], "rangeWithMaxValue:minValue:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  objc_msgSend(v3, "minValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  objc_msgSend(v3, "maxValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  if (v6 >= v8)
    objc_msgSend(v3, "maxValue");
  else
    objc_msgSend(v3, "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "minValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;
  objc_msgSend(v3, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  if (v12 > v14)
    objc_msgSend(v3, "minValue");
  else
    objc_msgSend(v3, "maxValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mapValue:fromRange:", v9, *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "mapValue:fromRange:", v15, *(_QWORD *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D316D0], "thresholdValueWithMinimumValue:maximumValue:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
