@implementation NTPBExternalAnalyticsConfig(FCAdditions)

+ (id)externalAnalyticsConfigWithDictionary:()FCAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (objc_class *)MEMORY[0x1E0D626B8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("analyticsBaseUrl"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalyticsBaseUrl:", v6);

  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("analyticsId"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalyticsId:", v7);

  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("eventQueryParameterName"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventQueryParameterName:", v8);

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryParameterConfig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", &__block_literal_global_179);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v5, "setQueryParameterConfigs:", v13);

  objc_msgSend(v5, "setUsesProxyProfile:", FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("usesProxyProfile"), 0));
  FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("proxyHostNames"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v5, "setProxyHostNames:", v15);

  FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("vpnProfileNames"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v5, "setVpnProfileNames:", v17);

  objc_msgSend(v5, "analyticsBaseUrl");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = v5;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

@end
