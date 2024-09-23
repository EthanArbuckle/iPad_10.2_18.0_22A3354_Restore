@implementation NTPBTodayWidgetConfig(NTAdditions)

- (void)setExternalAnalyticsConfigurations:()NTAdditions
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  objc_msgSend(a1, "setExternalAnalyticsConfigurationsData:", v4);

}

- (id)externalAnalyticsConfigurations
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "externalAnalyticsConfigurationsData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x24BDD1620];
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nf_securelyUnarchiveObjectOfClasses:withData:", v5, v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
