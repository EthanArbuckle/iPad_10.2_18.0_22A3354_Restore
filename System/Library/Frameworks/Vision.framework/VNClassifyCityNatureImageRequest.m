@implementation VNClassifyCityNatureImageRequest

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  VNSession *v10;
  void *v11;
  id v13;
  id v14;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v14 = 0;
  v6 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v14, v5, a3);
  v7 = v14;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_5;
  }
  if (!-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
  {
    v10 = objc_alloc_init(VNSession);
    v13 = v7;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v13, v5, v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "allCityNatureIdentifiersWithOptions:error:", v9, a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        goto LABEL_13;
      }
      if (a3)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
        v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  -[objc_class allCityNatureIdentifiersWithConfigurationOptions:error:](v6, "allCityNatureIdentifiersWithConfigurationOptions:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v9 = v7;
LABEL_13:

  return v8;
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
  VNCoreSceneUnderstandingDetectorCityNatureConfiguration *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  VNImageAnalyzerMultiDetectorCityNatureClassificationConfiguration *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VNClassifyCityNatureImageRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v17, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNClassifyCityNatureImageRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

  v8 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v8, a3))
  {
    v9 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorCityNatureConfiguration alloc], "initWithObservationsRecipient:", self);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));

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

      v14 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorCityNatureClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"));

    }
    v15 = v6;
  }

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v18, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v14 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 != 0;
      if (v15)
        -[VNRequest setResults:](self, "setResults:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNClassifyCityNatureImageRequest revisionAvailability]::ourRevisionAvailability;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a4)
    return 0;
  v8 = v4;
  v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNClassifyCityNatureImageRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

@end
