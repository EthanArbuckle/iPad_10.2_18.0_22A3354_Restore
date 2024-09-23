@implementation HRERecommendationItem(HUTriggerLikeItem)

- (id)identifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "recommendation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)trigger
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "recommendation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hu_triggerBuilderIfAny");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
