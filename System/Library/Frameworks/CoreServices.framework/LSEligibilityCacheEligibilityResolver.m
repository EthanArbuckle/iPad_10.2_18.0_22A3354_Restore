@implementation LSEligibilityCacheEligibilityResolver

- (id)eligibilityForDomain:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  void *v9;

  v6 = LaunchServices::EligibilityCache::shared((LaunchServices::EligibilityCache *)self);
  v7 = LaunchServices::EligibilityCache::cachedAnswerForDomain(v6, a3, a4);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
