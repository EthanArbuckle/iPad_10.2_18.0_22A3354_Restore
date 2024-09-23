@implementation VNFaceAnalyzerMultiDetectorFPrev3_1FArev1_3_MD2

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pixelFormatType");

  return v5;
}

+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0DC6C60], "FPrev3_1FArev1_3_MD2AndReturnError:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::FaceprintAndAttributes::modelVersion_fp3_1_fa1_3;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  return 0;
}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[VNValidationUtilities computeDeviceForKey:inOptions:error:](VNValidationUtilities, "computeDeviceForKey:inOptions:error:", CFSTR("VNDetectorInternalOption_ModelComputeDevice"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "modelPathForComputeDevice:error:", v7, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
