@implementation VN1JC7R3k4455fKQz0dY1VhQ

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VN1JC7R3k4455fKQz0dY1VhQ revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::onceToken, &__block_literal_global_1946);
  return (id)+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 3737841664)
  {
    v5 = CFSTR("VN6Ukf2f2QO979ttLvyg0ZAQ");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VN1JC7R3k4455fKQz0dY1VhQ;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
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
  v7.super_class = (Class)&OBJC_METACLASS___VN1JC7R3k4455fKQz0dY1VhQ;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

void __47__VN1JC7R3k4455fKQz0dY1VhQ_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF000uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::ourPrivateRevisions;
  +[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::ourPrivateRevisions = v8;

}

- (id)supportedAdjustmentKeysAndReturnError:(id *)a3
{
  unint64_t v5;
  objc_class *v6;
  objc_class *v7;
  id v8;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v6 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", 0, v5, a3);
  if (v6)
  {
    v7 = v6;
    if (-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
    {
      -[objc_class allPhotosAdjustmentKeys](v7, "allPhotosAdjustmentKeys");
      v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else if (-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()))
    {
      -[objc_class supportedAdjustmentKeys](v7, "supportedAdjustmentKeys");
      v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      *a3 = v8;
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 3737841664)
  {
    v4 = CFSTR("VNSliderNetDetectorType");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = CFSTR("VNImageAnalyzerMultiDetectorType");
LABEL_5:
    v5 = v4;
    return v4;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  VNImageAnalyzerMultiDetectorVN1JC7R3k4455fKQz0dY1VhQConfiguration *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VN1JC7R3k4455fKQz0dY1VhQ;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v11, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", -[VNRequest frameworkClass](self, "frameworkClass"), a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"));
    v9 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVN1JC7R3k4455fKQz0dY1VhQConfiguration alloc], "initWithObservationsRecipient:", self);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"));

  }
  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    if (a5)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", 1, self);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v20, a3, v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    if (v12)
    {
      objc_msgSend(v9, "imageBufferAndReturnError:", a5);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
      {
        v21[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        v17 = objc_msgSend(v9, "qosClass");
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        objc_msgSend(v12, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v13, self, a5, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v18 != 0;
        if (v18)
          -[VNRequest setResults:](self, "setResults:", v18);

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

  }
  return v10;
}

@end
