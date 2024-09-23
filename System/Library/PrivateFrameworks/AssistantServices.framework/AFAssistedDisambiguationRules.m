@implementation AFAssistedDisambiguationRules

- (unint64_t)decisionDepth
{
  return 2;
}

- (double)decisionAge
{
  return 480.0;
}

- (double)decisionThreshold
{
  return 1.0;
}

- (double)weightForEvent:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  if (v6 <= -900.0)
    return 1.0 / (double)-[AFAssistedDisambiguationRules decisionDepth](self, "decisionDepth");
  result = 1.0;
  if (v6 >= 0.0)
    return 1.0 / (double)-[AFAssistedDisambiguationRules decisionDepth](self, "decisionDepth");
  return result;
}

+ (id)defaultRules
{
  return objc_alloc_init(AFAssistedDisambiguationRules);
}

@end
