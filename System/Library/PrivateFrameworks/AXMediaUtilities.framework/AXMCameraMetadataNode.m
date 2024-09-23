@implementation AXMCameraMetadataNode

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
  return CFSTR("Camera Metadata");
}

- (void)triggerWithCameraType:(int64_t)a3 cacheKey:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("sourceProvidesResults");
  v16[1] = CFSTR("diagnosticsEnabled");
  v17[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXMVisionFeature featureWithCameraType:](AXMVisionFeature, "featureWithCameraType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFeature:", v14);
  v15.receiver = self;
  v15.super_class = (Class)AXMCameraMetadataNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v15, sel_triggerWithContext_cacheKey_resultHandler_, v13, v9, v8);

}

@end
