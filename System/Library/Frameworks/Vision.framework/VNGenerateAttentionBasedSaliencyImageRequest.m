@implementation VNGenerateAttentionBasedSaliencyImageRequest

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateAttentionBasedSaliencyImageRequest revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNGenerateAttentionBasedSaliencyImageRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNGenerateAttentionBasedSaliencyImageRequest privateRevisionsSet]::onceToken, &__block_literal_global_6127);
  return (id)+[VNGenerateAttentionBasedSaliencyImageRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 5)
    return off_1E45442C8[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNGenerateAttentionBasedSaliencyImageRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7;
  objc_super v9;

  v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", a1, a3);
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", a1, a4))return 0;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___VNGenerateAttentionBasedSaliencyImageRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

void __67__VNGenerateAttentionBasedSaliencyImageRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF003uLL, a2, a3, a4, a5, a6, a7, a8, 3737841668);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNGenerateAttentionBasedSaliencyImageRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNGenerateAttentionBasedSaliencyImageRequest privateRevisionsSet]::ourPrivateRevisions = v8;

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
  objc_class *v7;
  VNCoreSceneUnderstandingDetectorImageSaliencyAConfiguration *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  VNImageAnalyzerMultiDetectorSaliencyAConfiguration *v13;
  id v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VNGenerateAttentionBasedSaliencyImageRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v16, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v7, a3))
  {
    v8 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorImageSaliencyAConfiguration alloc], "initWithObservationsRecipient:", self);
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));

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

      v13 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSaliencyAConfiguration alloc], "initWithObservationsRecipient:", self);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"));

    }
    v14 = v6;
  }

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
