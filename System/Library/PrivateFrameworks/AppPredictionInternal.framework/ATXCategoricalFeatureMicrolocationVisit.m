@implementation ATXCategoricalFeatureMicrolocationVisit

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(a3, "microlocationVisitEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dominantMicrolocationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("Microlocation NA");

  return v7;
}

@end
