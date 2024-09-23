@implementation _HKFitnessFriendActivitySnapshot(ASMM)

- (BOOL)isAmm
{
  return objc_msgSend(a1, "amm") == 2;
}

- (id)mmvQuantity
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mmv");
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mmgQuantity
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mmg");
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)mmPercent
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "mmgQuantity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  if (v5 >= 0.00000011920929)
  {
    objc_msgSend(a1, "mmvQuantity", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v7);

  }
}

@end
