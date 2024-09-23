@implementation VNClassifyImageRequest

- (void)_setCustomHierarchy:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomHierarchy:", v5);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)VNClassifyImageRequest;
  -[VNImageBasedRequest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VNImageCropAndScaleOptionToString(-[VNClassifyImageRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@"), v4, v5);

  -[VNClassifyImageRequest customHierarchy](self, "customHierarchy");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v6);

  return v3;
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
LABEL_7:
    v9 = v8;
    return v8;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v7, a3))
  {
    v8 = CFSTR("VNImageAnalyzerMultiDetectorType");
    goto LABEL_7;
  }
  if (a3 == 3737841665)
  {
    v8 = CFSTR("VNSmartCam5GatingDetectorType");
    goto LABEL_7;
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
  VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  objc_super v13;
  VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *v14;
  VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VNClassifyImageRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v13, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v7, a3))
  {
    if (a3 == 3737841667)
    {
      v8 = -[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
      v16[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
    }
    else
    {
      v8 = -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorImageClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
      v15 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
    }
    goto LABEL_11;
  }
  v10 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v7, a3);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

    if (a3 != 3737841667)
    {
      v8 = -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSceneClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
      v14 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
LABEL_11:

      goto LABEL_12;
    }
    v8 = -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"));
LABEL_12:

    return v6;
  }
  if (a3 == 3737841665)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
    v8 = (VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationOriginatingRequestSpecifier"));
    goto LABEL_12;
  }
  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  -[VNClassifyImageRequest customHierarchy](self, "customHierarchy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHierarchy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = VisionCoreEqualOrNilObjects();

  if ((v7 & 1) != 0
    && (v8 = -[VNClassifyImageRequest maximumLeafObservations](self, "maximumLeafObservations"),
        v8 == objc_msgSend(v4, "maximumLeafObservations"))
    && (v9 = -[VNClassifyImageRequest maximumHierarchicalObservations](self, "maximumHierarchicalObservations"),
        v9 == objc_msgSend(v4, "maximumHierarchicalObservations")))
  {
    v12.receiver = self;
    v12.super_class = (Class)VNClassifyImageRequest;
    v10 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v12, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNClassifyImageRequest;
  -[VNRequest resolvedRevisionDidChangeFromRevision:](&v7, sel_resolvedRevisionDidChangeFromRevision_, a3);
  v4 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  -[VNClassifyImageRequest customHierarchy](self, "customHierarchy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "requestRevision") != v4)
    -[VNClassifyImageRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", 0);
  if (v4 == 3737841665)
  {
    -[VNClassifyImageRequest setMaximumLeafObservations:](self, "setMaximumLeafObservations:", 0x7FFFFFFFFFFFFFFFLL);
    -[VNClassifyImageRequest setMaximumHierarchicalObservations:](self, "setMaximumHierarchicalObservations:", 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNClassifyImageRequest *v4;
  void *v5;
  objc_super v6;

  v4 = (VNClassifyImageRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNClassifyImageRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNClassifyImageRequest customHierarchy](v4, "customHierarchy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClassifyImageRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", v5);

      -[VNClassifyImageRequest setMaximumLeafObservations:](self, "setMaximumLeafObservations:", -[VNClassifyImageRequest maximumLeafObservations](v4, "maximumLeafObservations"));
      -[VNClassifyImageRequest setMaximumHierarchicalObservations:](self, "setMaximumHierarchicalObservations:", -[VNClassifyImageRequest maximumHierarchicalObservations](v4, "maximumHierarchicalObservations"));
      -[VNClassifyImageRequest setImageCropAndScaleOption:](self, "setImageCropAndScaleOption:", -[VNClassifyImageRequest imageCropAndScaleOption](v4, "imageCropAndScaleOption"));
    }
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  if (a3 == 1)
  {
    if (a5)
    {
      +[VNError errorForUnsupportedConfigurationOfRequest:](VNError, "errorForUnsupportedConfigurationOfRequest:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      *a5 = v9;
    }
  }
  else if (a5)
  {
    +[VNError errorForInvalidOperationForRequestClass:revision:](VNError, "errorForInvalidOperationForRequestClass:revision:", objc_opt_class(), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  return 0;
}

- (NSArray)supportedIdentifiersAndReturnError:(NSError *)error
{
  unint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  VNSession *v10;
  void *v11;
  uint64_t v12;
  id v14;
  id v15;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v15 = 0;
  v6 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v15, v5, error);
  v7 = v15;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_5;
  }
  if (!-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
  {
    v10 = objc_alloc_init(VNSession);
    v14 = v7;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v14, v5, v10, error);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "allSceneIdentifiersWithOptions:error:", v9, error);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v8 = (void *)v12;
LABEL_15:

        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "supportedClassificationIdentifiersWithOptions:error:", v9, error);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (error)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
        v8 = 0;
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    v8 = 0;
    goto LABEL_15;
  }
  -[objc_class allClassificationIdentifiersWithConfigurationOptions:error:](v6, "allClassificationIdentifiersWithConfigurationOptions:error:", v7, error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v9 = v7;
LABEL_16:

  return (NSArray *)v8;
}

- (unint64_t)maximumLeafObservations
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumLeafObservations");

  return v3;
}

- (void)setMaximumLeafObservations:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumLeafObservations:", a3);

}

- (unint64_t)maximumHierarchicalObservations
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumHierarchicalObservations");

  return v3;
}

- (void)setMaximumHierarchicalObservations:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumHierarchicalObservations:", a3);

}

- (VNClassificationCustomHierarchy)customHierarchy
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customHierarchy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNClassificationCustomHierarchy *)v3;
}

- (BOOL)defineCustomHierarchy:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  if (!v6)
  {
    -[VNClassifyImageRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", 0);
    goto LABEL_5;
  }
  v7 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v8 = objc_msgSend(v6, "requestRevision");
  if (v7 == v8)
  {
    -[VNClassifyImageRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", v6);
LABEL_5:
    LOBYTE(a4) = 1;
    goto LABEL_8;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the custom hierarchy is for request revision %lu, not %lu"), v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
LABEL_8:

  return (char)a4;
}

- (id)defineCustomHierarchyWithRelationships:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  +[VNClassificationCustomHierarchy customHierarchyForRequest:error:](VNClassificationCustomHierarchy, "customHierarchyForRequest:error:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "customHierarchyWithAdditionalRelationships:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && -[VNClassifyImageRequest defineCustomHierarchy:error:](self, "defineCustomHierarchy:error:", v9, a4))
    {
      v10 = v9;
      v9 = v10;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }

  return v10;
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
  v9.super_class = (Class)&OBJC_METACLASS___VNClassifyImageRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (id)privateRevisionsSet
{
  if (+[VNClassifyImageRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNClassifyImageRequest privateRevisionsSet]::onceToken, &__block_literal_global_8416);
  return (id)+[VNClassifyImageRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 4)
    return off_1E45448D8[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNClassifyImageRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSArray)knownClassificationsForRevision:(NSUInteger)requestRevision error:(NSError *)error
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
  if ((objc_msgSend(v6, "setRevision:error:", requestRevision, error) & 1) != 0)
  {
    objc_msgSend(v6, "supportedIdentifiersAndReturnError:", error);
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

  return (NSArray *)v9;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNClassifyImageRequest revisionAvailability]::ourRevisionAvailability;
}

void __45__VNClassifyImageRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF001uLL, a2, a3, a4, a5, a6, a7, a8, 3737841666);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNClassifyImageRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNClassifyImageRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

@end
