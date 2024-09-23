@implementation NSArray(BLSHFlipbookFramesHistogram)

- (double)bls_doubleMedian
{
  unint64_t v2;
  char v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return 0.0;
  v3 = v2;
  v4 = v2 >> 1;
  objc_msgSend(a1, "objectAtIndex:", v2 >> 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if ((v3 & 1) == 0)
  {
    objc_msgSend(a1, "objectAtIndex:", v4 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    return (v7 + v10) * 0.5;
  }
  return v7;
}

- (unint64_t)bls_unsignedIntegerMedian
{
  unint64_t v2;
  char v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = v2 >> 1;
  objc_msgSend(a1, "objectAtIndex:", v2 >> 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(a1, "objectAtIndex:", v4 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongValue");

    return (unint64_t)(v8 + v6) >> 1;
  }
  return v6;
}

@end
