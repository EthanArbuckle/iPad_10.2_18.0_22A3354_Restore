@implementation VNClassifyJunkImageRequest

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  VNSession *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v5 = objc_alloc_init(VNSession);
  v10 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v10, -[VNRequest resolvedRevision](self, "resolvedRevision"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest resolvedRevision](self, "resolvedRevision"), self);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "allJunkIdentifiersForOptions:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VNClassifyJunkImageRequest;
  -[VNImageBasedRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VNImageCropAndScaleOptionToString(-[VNClassifyJunkImageRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
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
  VNCoreSceneUnderstandingDetectorJunkConfiguration *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  VNImageAnalyzerMultiDetectorJunkClassificationConfiguration *v12;
  id v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VNClassifyJunkImageRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v15, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", -[VNRequest frameworkClass](self, "frameworkClass"), a3))
  {
    v7 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorJunkConfiguration alloc], "initWithObservationsRecipient:", self);
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));

    v9 = v6;
  }
  else
  {
    v10 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", -[VNRequest frameworkClass](self, "frameworkClass"), a3);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

      v12 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorJunkClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("VNImageAnalyzerMultiDetectorOption_JunkConfiguration"));

    }
    v13 = v6;
  }

  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNClassifyJunkImageRequest imageCropAndScaleOption](self, "imageCropAndScaleOption");
  if (v5 == objc_msgSend(v4, "imageCropAndScaleOption"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNClassifyJunkImageRequest;
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
  VNClassifyJunkImageRequest *v4;
  objc_super v5;

  v4 = (VNClassifyJunkImageRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNClassifyJunkImageRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VNClassifyJunkImageRequest setImageCropAndScaleOption:](self, "setImageCropAndScaleOption:", -[VNClassifyJunkImageRequest imageCropAndScaleOption](v4, "imageCropAndScaleOption"));
  }

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

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  id v6;
  char v7;

  v6 = a3;
  if ((objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841666, 3737841664, a4) & 1) != 0&& objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841666, 1, a4)&& objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841669, 3737841670,
                       a4))
  {
    v7 = objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841667, 3737841668, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNClassifyJunkImageRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNClassifyJunkImageRequest privateRevisionsSet]::onceToken, &__block_literal_global_1632);
  return (id)+[VNClassifyJunkImageRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 7)
    return off_1E45434E8[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNClassifyJunkImageRequest;
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
  v7.super_class = (Class)&OBJC_METACLASS___VNClassifyJunkImageRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNClassifyJunkImageRequest revisionAvailability]::ourRevisionAvailability;
}

void __49__VNClassifyJunkImageRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 3737841669);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNClassifyJunkImageRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNClassifyJunkImageRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

@end
