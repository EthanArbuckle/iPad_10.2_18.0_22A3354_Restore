@implementation ATXSuggestedPagesDNDAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:](ATXSuggestedPagesUtils, "semanticTypeForSuggestedPageType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iOSAppAllowListForMode:", objc_msgSend(v4, "integerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_142);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __81__ATXSuggestedPagesDNDAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF8E50];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithBundleId:predictionSource:", v3, CFSTR("DND Configuration"));

  return v4;
}

@end
