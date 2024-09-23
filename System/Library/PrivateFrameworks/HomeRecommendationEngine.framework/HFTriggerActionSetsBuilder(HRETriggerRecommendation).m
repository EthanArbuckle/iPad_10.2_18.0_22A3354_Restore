@implementation HFTriggerActionSetsBuilder(HRETriggerRecommendation)

- (id)hre_recommendedActions
{
  void *v4;
  id v5;
  void *v6;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE4D100]);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithFromSet:", v6);

    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

@end
