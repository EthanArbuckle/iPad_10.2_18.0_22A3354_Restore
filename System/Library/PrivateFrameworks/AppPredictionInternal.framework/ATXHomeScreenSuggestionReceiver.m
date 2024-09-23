@implementation ATXHomeScreenSuggestionReceiver

- (void)logWidgetAddedFeaturesInCoreAnalytics:(id)a3 rankOfWidgetInGallery:(unint64_t)a4 galleryItems:(id)a5
{
  id v7;
  id v8;
  ATXHomeScreenLogWidgetAddedFeatures *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[ATXHomeScreenLogWidgetAddedFeatures initWithHSEvent:rankOfWidgetInGallery:galleryItems:]([ATXHomeScreenLogWidgetAddedFeatures alloc], "initWithHSEvent:rankOfWidgetInGallery:galleryItems:", v8, a4, v7);

  -[ATXHomeScreenLogWidgetAddedFeatures logWidgetAddedFeaturesInCoreAnalytics](v9, "logWidgetAddedFeaturesInCoreAnalytics");
}

@end
