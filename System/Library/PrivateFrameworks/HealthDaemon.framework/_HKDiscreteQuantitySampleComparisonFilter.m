@implementation _HKDiscreteQuantitySampleComparisonFilter

- (id)_comparisonQuantityAsNumber
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dataTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "canonicalUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValueForUnit:", v6);
    objc_msgSend(v5, "numberWithDouble:");
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

@end
