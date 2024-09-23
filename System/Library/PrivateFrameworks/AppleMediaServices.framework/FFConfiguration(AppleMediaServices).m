@implementation FFConfiguration(AppleMediaServices)

- (id)ams_safeStateForFeature:()AppleMediaServices domain:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "stateForFeature:domain:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ams_safeStateForFeature:()AppleMediaServices domain:level:
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "stateForFeature:domain:level:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
