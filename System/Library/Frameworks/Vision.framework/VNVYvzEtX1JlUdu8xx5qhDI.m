@implementation VNVYvzEtX1JlUdu8xx5qhDI

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v5;
  void *v6;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x1E0C80C00];
  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  if (v5 == 3737841665 || v5 == 1)
  {
    v8[0] = CFSTR("VN62b042cc67e0a7d589ecdb58232fe23d");
    v8[1] = CFSTR("VN9bdc36cda32be948a5089e37392596ec");
    v8[2] = CFSTR("VN81aedeb999c79d74e79af7f1c922cf97");
    v8[3] = CFSTR("VN9f5b8e9dc1b3c824d79372f87b072ee3");
    v8[4] = CFSTR("VNbe5c67b06e95370f5a7b67b13e73637c");
    v8[5] = CFSTR("VN220a6626eb3cb51295a4e250ad9da319");
    v8[6] = CFSTR("VN0af6454e97767772ce64a19ddaf61f0c");
    v8[7] = CFSTR("VNeeab04670e53ebeb25150a31963a1aa6");
    v8[8] = CFSTR("VNa0c07362d05e1dafb35b96d20d5ce42d");
    v8[9] = CFSTR("VN79a8f83d9d55eb4eb2c9695902c47b53");
    v8[10] = CFSTR("VNacdca02f0900c2cb198193f3eec7b6c9");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v6 = 0;
  }
  return v6;
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
  __CFString *v5;
  __CFString *v6;

  if (a3 == 3737841665 || a3 == 1)
  {
    v5 = CFSTR("VNImageAnalyzerMultiDetectorType");
    v6 = CFSTR("VNImageAnalyzerMultiDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  VNImageAnalyzerMultiDetectorVNVYvzEtX1JlUdu8xx5qhDIConfiguration *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNVYvzEtX1JlUdu8xx5qhDI;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v12, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNVYvzEtX1JlUdu8xx5qhDI imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

  v8 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", -[VNRequest frameworkClass](self, "frameworkClass"), a3);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

    v10 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVNVYvzEtX1JlUdu8xx5qhDIConfiguration alloc], "initWithObservationsRecipient:", self);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"));

  }
  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "imageCropAndScaleOption");
  if (v5 == -[VNVYvzEtX1JlUdu8xx5qhDI imageCropAndScaleOption](self, "imageCropAndScaleOption"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNVYvzEtX1JlUdu8xx5qhDI;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
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

+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  VNClassificationObservation *v15;
  double v16;
  VNClassificationObservation *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init((Class)a1);
  if ((objc_msgSend(v6, "setRevision:error:", a3, a4) & 1) != 0)
  {
    objc_msgSend(v6, "supportedIdentifiersAndReturnError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "specifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v15 = [VNClassificationObservation alloc];
            LODWORD(v16) = 1.0;
            v17 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v15, "initWithOriginatingRequestSpecifier:identifier:confidence:", v8, v14, v16, (_QWORD)v19);
            objc_msgSend(v9, "addObject:", v17);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::onceToken, &__block_literal_global_6400);
  return (id)+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::ourPrivateRevisions;
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
    return CFSTR("VNJ4fWm08v8TFm5lmRVji9G");
  if (a3 == 3737841665)
  {
    v5 = CFSTR("VNBcvG8BSEpHsJWme0UsCjT");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNVYvzEtX1JlUdu8xx5qhDI;
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
  v7.super_class = (Class)&OBJC_METACLASS___VNVYvzEtX1JlUdu8xx5qhDI;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

void __46__VNVYvzEtX1JlUdu8xx5qhDI_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF001uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::ourPrivateRevisions;
  +[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::ourPrivateRevisions = v8;

}

@end
