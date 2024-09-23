@implementation HealthAppTrendsLinkBuilder

- (id)URLForHealthTrends
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  +[HAServicesDefines internalHealthAppURLScheme](HAServicesDefines, "internalHealthAppURLScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheme:", v3);

  +[HAServicesDefines healthTrendsHostName](HAServicesDefines, "healthTrendsHostName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHost:", v4);

  objc_msgSend(v2, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
