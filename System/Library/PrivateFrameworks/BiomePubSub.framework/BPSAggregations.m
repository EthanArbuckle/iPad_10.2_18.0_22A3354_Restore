@implementation BPSAggregations

+ (id)min
{
  return -[BPSAggregator initWithAccumulator:closure:]([BPSAggregator alloc], "initWithAccumulator:closure:", 0, &__block_literal_global_6);
}

id __22__BPSAggregations_min__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    if (v8 < *(float *)&v9)
      *(float *)&v9 = v8;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v4;
  }
  v11 = v10;

  return v11;
}

+ (id)max
{
  return -[BPSAggregator initWithAccumulator:closure:]([BPSAggregator alloc], "initWithAccumulator:closure:", 0, &__block_literal_global_17);
}

id __22__BPSAggregations_max__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    if (v8 >= *(float *)&v9)
      *(float *)&v9 = v8;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v4;
  }
  v11 = v10;

  return v11;
}

+ (id)count
{
  return -[BPSAggregator initWithAccumulator:closure:]([BPSAggregator alloc], "initWithAccumulator:closure:", &unk_1E55656F0, &__block_literal_global_18);
}

uint64_t __24__BPSAggregations_count__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue") + 1);
}

+ (id)sum
{
  return -[BPSAggregator initWithAccumulator:closure:]([BPSAggregator alloc], "initWithAccumulator:closure:", &unk_1E55656F0, &__block_literal_global_20);
}

uint64_t __22__BPSAggregations_sum__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "floatValue");
  v7 = v6;
  objc_msgSend(v5, "floatValue");
  v9 = v8;

  *(float *)&v10 = v7 + v9;
  return objc_msgSend(v4, "numberWithFloat:", v10);
}

+ (id)avg
{
  BPSTuple *v2;
  BPSAggregator *v3;

  v2 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", &unk_1E55656F0, &unk_1E55656F0);
  v3 = -[BPSAggregator initWithAccumulator:closure:]([BPSAggregator alloc], "initWithAccumulator:closure:", v2, &__block_literal_global_23);

  return v3;
}

BPSTuple *__22__BPSAggregations_avg__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BPSTuple *v15;
  double v16;
  void *v17;
  void *v18;
  BPSTuple *v19;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v5, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v4, "floatValue");
  v12 = v11;

  v13 = v12 + (float)((float)v10++ * v8);
  v14 = v13 / (float)v10;
  v15 = [BPSTuple alloc];
  *(float *)&v16 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[BPSTuple initWithFirst:second:](v15, "initWithFirst:second:", v17, v18);

  return v19;
}

+ (id)approxPercentile
{
  BPSAggregator *v2;
  BPSApproxPercentileDigest *v3;
  BPSAggregator *v4;

  v2 = [BPSAggregator alloc];
  v3 = -[BPSApproxPercentileDigest initWithCapacity:]([BPSApproxPercentileDigest alloc], "initWithCapacity:", 50);
  v4 = -[BPSAggregator initWithAccumulator:closure:](v2, "initWithAccumulator:closure:", v3, &__block_literal_global_25);

  return v4;
}

id __35__BPSAggregations_approxPercentile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "floatValue");
  objc_msgSend(v4, "addValue:");
  return v4;
}

+ (id)approxPercentileWithDigestCapacity:(unint64_t)a3
{
  BPSAggregator *v4;
  BPSApproxPercentileDigest *v5;
  BPSAggregator *v6;

  v4 = [BPSAggregator alloc];
  v5 = -[BPSApproxPercentileDigest initWithCapacity:]([BPSApproxPercentileDigest alloc], "initWithCapacity:", a3);
  v6 = -[BPSAggregator initWithAccumulator:closure:](v4, "initWithAccumulator:closure:", v5, &__block_literal_global_27);

  return v6;
}

id __54__BPSAggregations_approxPercentileWithDigestCapacity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "floatValue");
  objc_msgSend(v4, "addValue:");
  return v4;
}

+ (id)approximateDistinctCount
{
  BPSAggregator *v2;
  BPSApproximateDistinctCount *v3;
  BPSAggregator *v4;

  v2 = [BPSAggregator alloc];
  v3 = objc_alloc_init(BPSApproximateDistinctCount);
  v4 = -[BPSAggregator initWithAccumulator:closure:](v2, "initWithAccumulator:closure:", v3, &__block_literal_global_29);

  return v4;
}

id __43__BPSAggregations_approximateDistinctCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addValue:", objc_msgSend(a3, "unsignedLongValue"));
  return v4;
}

@end
