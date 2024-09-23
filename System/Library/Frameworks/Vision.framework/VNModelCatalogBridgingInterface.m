@implementation VNModelCatalogBridgingInterface

- (id)foregroundBackgroundSegmentationModelBundleURLWithError:(id *)a3
{
  _TtC19ModelCatalogWrapper19ModelCatalogWrapper *v4;
  void *v5;

  v4 = objc_alloc_init(_TtC19ModelCatalogWrapper19ModelCatalogWrapper);
  -[ModelCatalogWrapper foregroundBackgroundSegmentationModelBundleURLAndReturnError:](v4, "foregroundBackgroundSegmentationModelBundleURLAndReturnError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:(id)a3
{
  id v3;
  _TtC19ModelCatalogWrapper19ModelCatalogWrapper *v4;

  v3 = a3;
  v4 = objc_alloc_init(_TtC19ModelCatalogWrapper19ModelCatalogWrapper);
  -[ModelCatalogWrapper downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:](v4, "downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:", v3);

}

@end
