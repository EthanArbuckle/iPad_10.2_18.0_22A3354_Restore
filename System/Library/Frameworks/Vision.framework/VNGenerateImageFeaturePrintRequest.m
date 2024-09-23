@implementation VNGenerateImageFeaturePrintRequest

- (VNImageCropAndScaleOption)imageCropAndScaleOption
{
  void *v2;
  VNImageCropAndScaleOption v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageCropAndScaleOption");

  return v3;
}

- (void)setImageCropAndScaleOption:(VNImageCropAndScaleOption)imageCropAndScaleOption
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageCropAndScaleOption:", imageCropAndScaleOption);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VNGenerateImageFeaturePrintRequest;
  -[VNImageBasedRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VNImageCropAndScaleOptionToString(-[VNGenerateImageFeaturePrintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  objc_class *v7;
  __CFString *v8;
  __CFString *v9;

  v7 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v7, a3))
  {
    v8 = CFSTR("VNCoreSceneUnderstandingDetectorType");
LABEL_5:
    v9 = v8;
    return v8;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v7, a3))
  {
    v8 = CFSTR("VNImageAnalyzerMultiDetectorType");
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  VNCoreSceneUnderstandingDetectorSceneprintConfiguration *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  VNImageAnalyzerMultiDetectorSceneprintConfiguration *v14;
  void *v15;
  id v16;
  id v17;
  objc_super v19;
  VNImageAnalyzerMultiDetectorSceneprintConfiguration *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VNGenerateImageFeaturePrintRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v19, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNGenerateImageFeaturePrintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

  v8 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v8, a3))
  {
    v9 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorSceneprintConfiguration alloc], "initWithObservationsRecipient:", self);
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"));

    v11 = v6;
  }
  else
  {
    v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v8, a3);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

      v14 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSceneprintConfiguration alloc], "initWithObservationsRecipient:", self);
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"));

      v16 = v6;
    }
    else
    {
      v17 = v6;
    }
  }

  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  VNImageCropAndScaleOption v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNGenerateImageFeaturePrintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption");
  if (v5 == objc_msgSend(v4, "imageCropAndScaleOption"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNGenerateImageFeaturePrintRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNGenerateImageFeaturePrintRequest *v4;
  objc_super v5;

  v4 = (VNGenerateImageFeaturePrintRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNGenerateImageFeaturePrintRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VNGenerateImageFeaturePrintRequest setImageCropAndScaleOption:](self, "setImageCropAndScaleOption:", -[VNGenerateImageFeaturePrintRequest imageCropAndScaleOption](v4, "imageCropAndScaleOption"));
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  if (a3 - 1 > 1)
  {
    if (a5)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedConfigurationOfRequest:](VNError, "errorForUnsupportedConfigurationOfRequest:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    *a5 = v9;
  }

  return 0;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateImageFeaturePrintRequest revisionAvailability]::ourRevisionAvailability;
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  if ((objc_msgSend(v5, "registerRequestClassName:revision:equivalencyToRequestClassName:revision:error:", CFSTR("VNGenerateImageFeaturePrintRequest"), 1, CFSTR("VNCreateSceneprintRequest"), 2, a4) & 1) != 0)v6 = objc_msgSend(v5, "registerRequestClassName:revision:equivalencyToRequestClassName:revision:error:", CFSTR("VNGenerateImageFeaturePrintRequest"), 2, CFSTR("VNCreateSceneprintRequest"), 3, a4);
  else
    v6 = 0;

  return v6;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7;
  objc_super v9;

  v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", a1, a3);
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", a1, a4))return 0;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___VNGenerateImageFeaturePrintRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

@end
