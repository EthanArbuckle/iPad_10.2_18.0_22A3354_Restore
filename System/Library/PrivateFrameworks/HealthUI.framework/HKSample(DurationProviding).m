@implementation HKSample(DurationProviding)

- (double)duration
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v4 - v6;

  return v7;
}

@end
