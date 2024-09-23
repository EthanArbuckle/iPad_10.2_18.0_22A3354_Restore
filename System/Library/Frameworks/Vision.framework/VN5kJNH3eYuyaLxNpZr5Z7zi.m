@implementation VN5kJNH3eYuyaLxNpZr5Z7zi

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
  if (+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::onceToken, &__block_literal_global_5475);
  return (id)+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 5)
    return off_1E4544008[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VN5kJNH3eYuyaLxNpZr5Z7zi;
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
  v7.super_class = (Class)&OBJC_METACLASS___VN5kJNH3eYuyaLxNpZr5Z7zi;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

void __47__VN5kJNH3eYuyaLxNpZr5Z7zi_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 3737841667);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::ourPrivateRevisions;
  +[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::ourPrivateRevisions = v8;

}

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
        objc_msgSend(v11, "allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithOptions:error:", v9, a3);
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
  -[objc_class allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithConfigurationOptions:error:](v6, "allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithConfigurationOptions:error:", v7, a3);
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
  VNCoreSceneUnderstandingDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  VNImageAnalyzerMultiDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7zi;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v17, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VN5kJNH3eYuyaLxNpZr5Z7zi imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

  v8 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v8, a3))
  {
    v9 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration alloc], "initWithObservationsRecipient:", self);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));

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

      v14 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration alloc], "initWithObservationsRecipient:", self);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"));

    }
    v15 = v6;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VN5kJNH3eYuyaLxNpZr5Z7zi *v4;
  objc_super v5;

  v4 = (VN5kJNH3eYuyaLxNpZr5Z7zi *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7zi;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VN5kJNH3eYuyaLxNpZr5Z7zi setImageCropAndScaleOption:](self, "setImageCropAndScaleOption:", -[VN5kJNH3eYuyaLxNpZr5Z7zi imageCropAndScaleOption](v4, "imageCropAndScaleOption"));
  }

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "imageCropAndScaleOption");
  if (v5 == -[VN5kJNH3eYuyaLxNpZr5Z7zi imageCropAndScaleOption](self, "imageCropAndScaleOption"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7zi;
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

@end
