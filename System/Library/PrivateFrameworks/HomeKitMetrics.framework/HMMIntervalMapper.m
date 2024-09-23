@implementation HMMIntervalMapper

- (id)intervalIndexForValue:(unint64_t)a3
{
  return 0;
}

- (id)intervalForValue:(unint64_t)a3
{
  return 0;
}

+ (id)unsignedOpenClosedFixedIntervalMapper:(id)a3
{
  id v3;
  UnsignedFixedIntervalMapper *v4;

  v3 = a3;
  v4 = -[UnsignedFixedIntervalMapper initWithBins:intervalCreationBlock:valueComparisonBlock:]([UnsignedFixedIntervalMapper alloc], "initWithBins:intervalCreationBlock:valueComparisonBlock:", v3, &__block_literal_global, &__block_literal_global_71);

  return v4;
}

+ (id)unsignedClosedOpenFixedIntervalMapper:(id)a3
{
  id v3;
  UnsignedFixedIntervalMapper *v4;

  v3 = a3;
  v4 = -[UnsignedFixedIntervalMapper initWithBins:intervalCreationBlock:valueComparisonBlock:]([UnsignedFixedIntervalMapper alloc], "initWithBins:intervalCreationBlock:valueComparisonBlock:", v3, &__block_literal_global_73, &__block_literal_global_74);

  return v4;
}

BOOL __59__HMMIntervalMapper_unsignedClosedOpenFixedIntervalMapper___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  return objc_msgSend(a3, "unsignedIntValue") > a2;
}

id __59__HMMIntervalMapper_unsignedClosedOpenFixedIntervalMapper___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HMMInterval closedOpenIntervalFromStart:toEnd:](HMMInterval, "closedOpenIntervalFromStart:toEnd:", a2, a3);
}

BOOL __59__HMMIntervalMapper_unsignedOpenClosedFixedIntervalMapper___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  return objc_msgSend(a3, "unsignedIntValue") >= a2;
}

id __59__HMMIntervalMapper_unsignedOpenClosedFixedIntervalMapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  +[HMMInterval positiveInfinityEnd](HMMInterval, "positiveInfinityEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
    +[HMMInterval openOpenIntervalFromStart:toEnd:](HMMInterval, "openOpenIntervalFromStart:toEnd:", v5, v4);
  else
    +[HMMInterval openClosedIntervalFromStart:toEnd:](HMMInterval, "openClosedIntervalFromStart:toEnd:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
