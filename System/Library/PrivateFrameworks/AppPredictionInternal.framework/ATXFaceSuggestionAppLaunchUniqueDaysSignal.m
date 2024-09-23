@implementation ATXFaceSuggestionAppLaunchUniqueDaysSignal

- (ATXFaceSuggestionAppLaunchUniqueDaysSignal)initWithAppLaunchDictionary:(id)a3
{
  id v4;
  ATXFaceSuggestionAppLaunchUniqueDaysSignal *v5;
  uint64_t v6;
  NSDictionary *appLaunchDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFaceSuggestionAppLaunchUniqueDaysSignal;
  v5 = -[ATXFaceSuggestionAppLaunchUniqueDaysSignal init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    appLaunchDictionary = v5->_appLaunchDictionary;
    v5->_appLaunchDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (double)valueForDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *appLaunchDictionary;
  void *v7;
  void *v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    appLaunchDictionary = self->_appLaunchDictionary;
    objc_msgSend(v4, "containerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](appLaunchDictionary, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (double)(unint64_t)objc_msgSend(v8, "uniqueDaysLaunched");

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)weight
{
  return 0.2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchDictionary, 0);
}

@end
