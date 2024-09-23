@implementation ATXReservoirSampler

+ (id)sampleWeightedArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_5);
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__ATXReservoirSampler_sampleWeightedArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  long double v10;
  void *v11;
  long double v12;
  void *v13;

  objc_msgSend(a2, "doubleValue");
  if (v4 >= 0.001)
  {
    v8 = v4;
    +[ATXReservoirSampler _standardUniformDistribution](ATXReservoirSampler, "_standardUniformDistribution");
    v10 = log(v9 + 0.001);
    v11 = (void *)MEMORY[0x1E0D81638];
    v12 = v10 / v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tupleWithFirst:second:", v6, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D81638];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tupleWithFirst:second:", v6, &unk_1E82C36F0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __43__ATXReservoirSampler_sampleWeightedArray___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __43__ATXReservoirSampler_sampleWeightedArray___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

+ (id)sampleWeightedArray:(id)a3 numToSample:(unint64_t)a4
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  objc_msgSend(a1, "sampleWeightedArray:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 >= a4)
    v7 = a4;
  else
    v7 = v6;
  objc_msgSend(v5, "subarrayWithRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (double)_standardUniformDistribution
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
}

@end
