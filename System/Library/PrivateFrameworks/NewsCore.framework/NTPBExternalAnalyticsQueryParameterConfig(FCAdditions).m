@implementation NTPBExternalAnalyticsQueryParameterConfig(FCAdditions)

+ (id)externalAnalyticsQueryParameterConfigWithDictionary:()FCAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D626C0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("name"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("value"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setValue:", v7);
  return v5;
}

@end
