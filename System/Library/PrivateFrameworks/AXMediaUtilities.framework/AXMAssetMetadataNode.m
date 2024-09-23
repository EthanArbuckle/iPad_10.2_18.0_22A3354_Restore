@implementation AXMAssetMetadataNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Asset Metadata");
}

- (void)triggerWithAssetURL:(id)a3 cacheKey:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18[0] = CFSTR("sourceProvidesResults");
  v18[1] = CFSTR("diagnosticsEnabled");
  v19[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
  if (v8)
  {
    +[AXMVisionFeatureAssetMetadata assetMetadataFromURL:](AXMVisionFeatureAssetMetadata, "assetMetadataFromURL:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionFeature featureWithAssetMetadata:](AXMVisionFeature, "featureWithAssetMetadata:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v14, "appendFeature:", v16);

  }
  v17.receiver = self;
  v17.super_class = (Class)AXMAssetMetadataNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v17, sel_triggerWithContext_cacheKey_resultHandler_, v14, v9, v10);

}

@end
