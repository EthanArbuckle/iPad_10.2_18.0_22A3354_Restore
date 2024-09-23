@implementation VNGenerateObjectnessBasedSaliencyImageRequest

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  objc_class *v7;
  VNCoreSceneUnderstandingDetectorImageSaliencyOConfiguration *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  VNImageAnalyzerMultiDetectorSaliencyOConfiguration *v13;
  id v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VNGenerateObjectnessBasedSaliencyImageRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v16, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v7, a3))
  {
    v8 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorImageSaliencyOConfiguration alloc], "initWithObservationsRecipient:", self);
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"));

    v10 = v6;
  }
  else
  {
    v11 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v7, a3);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

      v13 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSaliencyOConfiguration alloc], "initWithObservationsRecipient:", self);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"));

    }
    v14 = v6;
  }

  return v6;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateObjectnessBasedSaliencyImageRequest revisionAvailability]::ourRevisionAvailability;
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

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNGenerateObjectnessBasedSaliencyImageRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNGenerateObjectnessBasedSaliencyImageRequest privateRevisionsSet]::onceToken, &__block_literal_global_32196);
  return (id)+[VNGenerateObjectnessBasedSaliencyImageRequest privateRevisionsSet]::ourPrivateRevisions;
}

void __68__VNGenerateObjectnessBasedSaliencyImageRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNGenerateObjectnessBasedSaliencyImageRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNGenerateObjectnessBasedSaliencyImageRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing Analyze Image Objectness request\n"), v9, v10, v11, v12, v13, v14, v24);
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v8, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v25, a3, v16, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v25;
    if (v17)
    {
      v26[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v20 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v20, v18, self, a5, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 != 0;
      if (v21)
        -[VNRequest setResults:](self, "setResults:", v21);

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 3)
    return *((id *)&off_1E4548C38 + a3 - 3737841664u);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNGenerateObjectnessBasedSaliencyImageRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v7.super_class = (Class)&OBJC_METACLASS___VNGenerateObjectnessBasedSaliencyImageRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

@end
