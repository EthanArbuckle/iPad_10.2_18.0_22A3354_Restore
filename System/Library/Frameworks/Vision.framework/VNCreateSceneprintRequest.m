@implementation VNCreateSceneprintRequest

- (id)VNImageProcessingSessionPrintKeyPath
{
  return CFSTR("sceneprints.@firstObject");
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  id v6;
  char v7;

  v6 = a3;
  if ((objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3, 3737841671, a4) & 1) != 0)
    v7 = objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841671, 3737841672, a4);
  else
    v7 = 0;

  return v7;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateSceneprintRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNCreateSceneprintRequest privateRevisionsSet]::onceToken, &__block_literal_global_26356);
  return (id)+[VNCreateSceneprintRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 9)
    return off_1E4547748[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNCreateSceneprintRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v9.super_class = (Class)&OBJC_METACLASS___VNCreateSceneprintRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

void __48__VNCreateSceneprintRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 3737841671);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNCreateSceneprintRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNCreateSceneprintRequest privateRevisionsSet]::ourPrivateRevisions = v8;

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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)VNCreateSceneprintRequest;
  -[VNImageBasedRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VNImageCropAndScaleOptionToString(-[VNCreateSceneprintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@"), v4, v5);

  if (-[VNCreateSceneprintRequest useCenterTileOnly](self, "useCenterTileOnly"))
    objc_msgSend(v3, "appendString:", CFSTR(" useCenterTileOnly"));
  if (-[VNCreateSceneprintRequest returnAllResults](self, "returnAllResults"))
    objc_msgSend(v3, "appendString:", CFSTR(" returnAllResults"));
  return v3;
}

- (BOOL)returnAllResults
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "returnAllResults");

  return v3;
}

- (void)setReturnAllResults:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnAllResults:", v3);

}

- (BOOL)useCenterTileOnly
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useCenterTileOnly");

  return v3;
}

- (void)setUseCenterTileOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseCenterTileOnly:", v3);

}

- (unint64_t)imageCropAndScaleOption
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageCropAndScaleOption");

  return v3;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageCropAndScaleOption:", a3);

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  int v7;
  unint64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  if ((objc_msgSend(v4, "resolvedRevision") != 2
     || (v5 = -[VNRequest detectionLevel](self, "detectionLevel"), v5 == objc_msgSend(v4, "detectionLevel")))
    && (v6 = -[VNCreateSceneprintRequest returnAllResults](self, "returnAllResults"),
        v6 == objc_msgSend(v4, "returnAllResults"))
    && (v7 = -[VNCreateSceneprintRequest useCenterTileOnly](self, "useCenterTileOnly"),
        v7 == objc_msgSend(v4, "useCenterTileOnly"))
    && (v8 = -[VNCreateSceneprintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"),
        v8 == objc_msgSend(v4, "imageCropAndScaleOption")))
  {
    v11.receiver = self;
    v11.super_class = (Class)VNCreateSceneprintRequest;
    v9 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v11, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNCreateSceneprintRequest *v4;
  objc_super v5;

  v4 = (VNCreateSceneprintRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNCreateSceneprintRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNCreateSceneprintRequest setReturnAllResults:](self, "setReturnAllResults:", -[VNCreateSceneprintRequest returnAllResults](v4, "returnAllResults"));
      -[VNCreateSceneprintRequest setUseCenterTileOnly:](self, "setUseCenterTileOnly:", -[VNCreateSceneprintRequest useCenterTileOnly](v4, "useCenterTileOnly"));
      -[VNCreateSceneprintRequest setImageCropAndScaleOption:](self, "setImageCropAndScaleOption:", -[VNCreateSceneprintRequest imageCropAndScaleOption](v4, "imageCropAndScaleOption"));
    }
  }

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
  v19.super_class = (Class)VNCreateSceneprintRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v19, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNCreateSceneprintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
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

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a3 == 2 || a3 == 3737841666)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v21, a3, v11, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v21;
      if (v12)
      {
        v22[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNCreateSceneprintRequest useCenterTileOnly](self, "useCenterTileOnly"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("VNEspressoModelClassifierProcessOption_CenterTileOnly"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNCreateSceneprintRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

        v17 = objc_msgSend(v9, "qosClass");
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        objc_msgSend(v12, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v13, self, a5, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 != 0;
        if (v18)
          -[VNRequest setResults:](self, "setResults:", v18);

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)supportedImageSizeSet
{
  unint64_t v3;
  VNSupportedImageSize *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  if (v3 == 3737841666 || v3 == 2)
  {
    v4 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", 1111970369, 299, 299, 1, 0, 0);
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNCreateSceneprintRequest;
    -[VNImageBasedRequest supportedImageSizeSet](&v7, sel_supportedImageSizeSet);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNCreateSceneprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
