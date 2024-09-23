@implementation HDOntologyMedsScanningFeatureEvaluator

- (HDOntologyMedsScanningFeatureEvaluator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB5718];
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  return 0;
}

+ (double)minimumTimeToLive
{
  double v2;

  HDOntologyFeatureDefaultMinimumTimeToLive();
  return v2 + v2;
}

@end
