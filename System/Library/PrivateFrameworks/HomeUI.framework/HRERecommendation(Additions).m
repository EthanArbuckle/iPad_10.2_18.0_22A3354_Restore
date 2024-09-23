@implementation HRERecommendation(Additions)

- (id)hu_asActionSetRecommendation
{
  id v2;
  void *v3;
  id v4;

  objc_opt_class();
  v2 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)hu_asTriggerRecommendation
{
  id v2;
  void *v3;
  id v4;

  objc_opt_class();
  v2 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)hu_asActionRecommendation
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EF347DF0))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)hu_triggerBuilderIfAny
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hu_asTriggerRecommendation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectedTriggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hu_actionSetBuilderIfAny
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hu_asActionSetRecommendation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectedActionSetBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
