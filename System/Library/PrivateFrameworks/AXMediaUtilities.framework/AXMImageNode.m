@implementation AXMImageNode

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
  return CFSTR("Image");
}

- (void)produceImage:(id)a3
{
  objc_msgSend(a3, "produceImage:", &__block_literal_global_37);
}

id __29__AXMImageNode_produceImage___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("input"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "inputType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "fileExistsAtPath:", v10) ^ 1;

    }
    else
    {
      v11 = 1;
    }

    if (a3 && v11)
    {
      objc_msgSend(v5, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _AXMMakeError(0, CFSTR("Input file URL does not exist: %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("input"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)triggerWithImage:(id)a3 options:(id)a4 cacheKey:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[AXMPipelineContextInput inputWithCIImage:](AXMPipelineContextInput, "inputWithCIImage:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("input");
  v19[1] = CFSTR("diagnosticsEnabled");
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
  v18.receiver = self;
  v18.super_class = (Class)AXMImageNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v18, sel_triggerWithContext_cacheKey_resultHandler_, v17, v12, v13);

}

- (void)triggerWithImageURL:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 options:(id)a6 cacheKey:(id)a7 resultHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  AXMImageNode *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v26 = a7;
  v25 = a8;
  if (!v17)
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[AXMPipelineContextInput inputWithURL:photoLibraryURL:](AXMPipelineContextInput, "inputWithURL:photoLibraryURL:", v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("input");
  v28[1] = CFSTR("diagnosticsEnabled");
  v29[0] = v18;
  v19 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v21, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
  +[AXMVisionFeatureAssetMetadata assetMetadataFromURL:localIdentifier:photoLibraryURL:](AXMVisionFeatureAssetMetadata, "assetMetadataFromURL:localIdentifier:photoLibraryURL:", v14, v15, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionFeature featureWithAssetMetadata:](AXMVisionFeature, "featureWithAssetMetadata:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v22, "appendFeature:", v24);
  v27.receiver = v19;
  v27.super_class = (Class)AXMImageNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v27, sel_triggerWithContext_cacheKey_resultHandler_, v22, v26, v25);

}

- (void)triggerWithImageURL:(id)a3 options:(id)a4 cacheKey:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[AXMPipelineContextInput inputWithURL:](AXMPipelineContextInput, "inputWithURL:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("input");
  v21[1] = CFSTR("diagnosticsEnabled");
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
  +[AXMVisionFeatureAssetMetadata assetMetadataFromURL:](AXMVisionFeatureAssetMetadata, "assetMetadataFromURL:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionFeature featureWithAssetMetadata:](AXMVisionFeature, "featureWithAssetMetadata:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v17, "appendFeature:", v19);
  v20.receiver = self;
  v20.super_class = (Class)AXMImageNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v20, sel_triggerWithContext_cacheKey_resultHandler_, v17, v12, v13);

}

- (void)triggerWithPixelBuffer:(__CVBuffer *)a3 exifOrientation:(unsigned int)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v9 = *(_QWORD *)&a4;
  v22[2] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!v12)
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[AXMPixelBufferWrapper wrapperWithPixelBuffer:orientation:](AXMPixelBufferWrapper, "wrapperWithPixelBuffer:orientation:", a3, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMPipelineContextInput inputWithPixelBuffer:](AXMPipelineContextInput, "inputWithPixelBuffer:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("input");
  v21[1] = CFSTR("diagnosticsEnabled");
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v18, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
  v20.receiver = self;
  v20.super_class = (Class)AXMImageNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v20, sel_triggerWithContext_cacheKey_resultHandler_, v19, v13, v14);

}

- (void)triggerWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  AXMPhotoAssetData *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  AXMImageNode *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v31 = a6;
  v30 = a7;
  if (!v14)
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = -[AXMPhotoAssetData initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:]([AXMPhotoAssetData alloc], "initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:", v12, v13, 0, 1);
  v16 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  -[AXMPhotoAssetData imageData](v15, "imageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithData:", v17);

  objc_msgSend(v18, "imageByApplyingOrientation:", -[AXMPhotoAssetData orientation](v15, "orientation"));
  v19 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v19;
  +[AXMPipelineContextInput inputWithCIImage:photoLibraryURL:](AXMPipelineContextInput, "inputWithCIImage:photoLibraryURL:", v19, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("input");
  v33[1] = CFSTR("diagnosticsEnabled");
  v34[0] = v20;
  v21 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v23, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
  -[AXMPhotoAssetData creationDate](v15, "creationDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMPhotoAssetData UTI](v15, "UTI");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionFeatureAssetMetadata assetMetadataWithLocalIdentifier:photoLibraryURL:creationDate:UTI:](AXMVisionFeatureAssetMetadata, "assetMetadataWithLocalIdentifier:photoLibraryURL:creationDate:UTI:", v12, v13, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXMVisionFeature featureWithAssetMetadata:](AXMVisionFeature, "featureWithAssetMetadata:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v24, "appendFeature:", v28);
  v32.receiver = v21;
  v32.super_class = (Class)AXMImageNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v32, sel_triggerWithContext_cacheKey_resultHandler_, v24, v31, v30);

}

- (void)triggerWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 usePHAsset:(BOOL)a5 options:(id)a6 cacheKey:(id)a7 resultHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  AXMPhotoAssetData *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  AXMPhotoAssetData *v29;
  AXMImageNode *v30;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (a5)
  {
    v28 = v17;
    if (!v16)
    {
      +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = -[AXMPhotoAssetData initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:]([AXMPhotoAssetData alloc], "initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:", v14, v15, 0, 0);
    +[AXMPipelineContextInput inputWithPHAssetLocalIdentifier:photoLibraryURL:](AXMPipelineContextInput, "inputWithPHAssetLocalIdentifier:photoLibraryURL:", v14, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = CFSTR("input");
    v32[1] = CFSTR("diagnosticsEnabled");
    v33[0] = v27;
    v30 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v21, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setShouldCallCompletionHandlersForEngineBusyError:", 1);
    -[AXMPhotoAssetData creationDate](v19, "creationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v19;
    -[AXMPhotoAssetData UTI](v19, "UTI");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionFeatureAssetMetadata assetMetadataWithLocalIdentifier:photoLibraryURL:creationDate:UTI:](AXMVisionFeatureAssetMetadata, "assetMetadataWithLocalIdentifier:photoLibraryURL:creationDate:UTI:", v14, v15, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[AXMVisionFeature featureWithAssetMetadata:](AXMVisionFeature, "featureWithAssetMetadata:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v22, "appendFeature:", v26);
    v31.receiver = v30;
    v31.super_class = (Class)AXMImageNode;
    v17 = v28;
    -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v31, sel_triggerWithContext_cacheKey_resultHandler_, v22, v28, v18);

  }
  else
  {
    -[AXMImageNode triggerWithImageAssetLocalIdentifier:photoLibraryURL:options:cacheKey:resultHandler:](self, "triggerWithImageAssetLocalIdentifier:photoLibraryURL:options:cacheKey:resultHandler:", v14, v15, v16, v17, v18);
  }

}

@end
