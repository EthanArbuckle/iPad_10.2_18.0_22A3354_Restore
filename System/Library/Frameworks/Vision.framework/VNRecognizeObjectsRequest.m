@implementation VNRecognizeObjectsRequest

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
        objc_msgSend(v11, "allRecognizedObjectsIdentifiersWithOptions:error:", v9, a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        goto LABEL_13;
      }
      if (a3)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest resolvedRevision](self, "resolvedRevision"), self);
        v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  -[objc_class allRecognizedObjectIdentifiersWithConfigurationOptions:error:](v6, "allRecognizedObjectIdentifiersWithConfigurationOptions:error:", v7, a3);
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

- (BOOL)useImageAnalyzerScaling
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useImageAnalyzerScaling");

  return v3;
}

- (void)setUseImageAnalyzerScaling:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseImageAnalyzerScaling:", v3);

}

- (float)modelMinimumDetectionConfidence
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelMinimumDetectionConfidence");
  v4 = v3;

  return v4;
}

- (void)setModelMinimumDetectionConfidence:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setModelMinimumDetectionConfidence:", v4);

}

- (float)modelNonMaximumSuppressionThreshold
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelNonMaximumSuppressionThreshold");
  v4 = v3;

  return v4;
}

- (void)setModelNonMaximumSuppressionThreshold:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setModelNonMaximumSuppressionThreshold:", v4);

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
  VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VNRecognizeObjectsRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v17, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRecognizeObjectsRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

  v8 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v8, a3))
  {
    v9 = -[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration alloc], "initWithObservationsRecipient:", self);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));

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

      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"));
      v14 = -[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration alloc], "initWithObservationsRecipient:", self);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"));

    }
    v15 = v6;
  }

  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  -[VNRecognizeObjectsRequest modelMinimumDetectionConfidence](self, "modelMinimumDetectionConfidence");
  v6 = v5;
  objc_msgSend(v4, "modelMinimumDetectionConfidence");
  if (v6 == v7
    && (-[VNRecognizeObjectsRequest modelNonMaximumSuppressionThreshold](self, "modelNonMaximumSuppressionThreshold"),
        v9 = v8,
        objc_msgSend(v4, "modelNonMaximumSuppressionThreshold"),
        v9 == v10))
  {
    v13.receiver = self;
    v13.super_class = (Class)VNRecognizeObjectsRequest;
    v11 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v13, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)knownObjectIdentifiersRecognizedByRequestRevision:(unint64_t)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = objc_alloc_init((Class)a1);
  if ((objc_msgSend(v6, "setRevision:error:", a3, a4) & 1) != 0)
  {
    objc_msgSend(v6, "supportedIdentifiersAndReturnError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNRecognizeObjectsRequest revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNRecognizeObjectsRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNRecognizeObjectsRequest privateRevisionsSet]::onceToken, &__block_literal_global_7631);
  return (id)+[VNRecognizeObjectsRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u > 3)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E4544660 + a3 - 3737841664u);
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7;
  objc_super v9;

  v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", a1, a3);
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", a1, a4))return 0;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___VNRecognizeObjectsRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

void __48__VNRecognizeObjectsRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF003uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNRecognizeObjectsRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNRecognizeObjectsRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

@end
