@implementation VNSceneClassificationRequest

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
  v9.super_class = (Class)&OBJC_METACLASS___VNSceneClassificationRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (const)dependentRequestCompatibility
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNSceneClassificationRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE63F9B0 = objc_opt_class();
    unk_1EE63F9B8 = xmmword_1A15C3FE0;
    qword_1EE63F9C8 = objc_opt_class();
    unk_1EE63F9D0 = 2;
    qword_1EE63F9E0 = 0;
    unk_1EE63F9E8 = 0;
    qword_1EE63F9D8 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNSceneClassificationRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (NSArray)knownSceneClassifications
{
  void *v2;
  void *v3;
  NSArray *v4;

  objc_msgSend(a1, "knownSceneClassificationsForRevision:error:", objc_msgSend(a1, "defaultRevision"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

+ (id)knownSceneClassificationsForRevision:(unint64_t)a3 error:(id *)a4
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

+ (id)privateRevisionsSet
{
  if (+[VNSceneClassificationRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNSceneClassificationRequest privateRevisionsSet]::onceToken, &__block_literal_global_2309);
  return (id)+[VNSceneClassificationRequest privateRevisionsSet]::ourPrivateRevisions;
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
    return CFSTR("VNSceneClassificationRequestPrivateRevisionSceneNetV4");
  if (a3 == 3737841665)
  {
    v5 = CFSTR("VNSceneClassificationRequestPrivateRevisionSceneNetV5");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNSceneClassificationRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __51__VNSceneClassificationRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF001uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNSceneClassificationRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNSceneClassificationRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

- (VNSceneClassificationRequest)initWithSceneObservation:(id)a3
{
  return -[VNSceneClassificationRequest initWithSceneObservation:completionHandler:](self, "initWithSceneObservation:completionHandler:", a3, 0);
}

- (VNSceneClassificationRequest)initWithSceneObservation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  VNSceneClassificationRequest *v8;
  VNSceneClassificationRequest *v9;
  VNSceneClassificationRequest *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[VNRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", v7);
  v9 = v8;
  if (v8)
  {
    -[VNSceneClassificationRequest setSceneObservation:](v8, "setSceneObservation:", v6);
    -[VNRequest setRevision:](v9, "setRevision:", objc_msgSend(v6, "requestRevision"));
    v10 = v9;
  }

  return v9;
}

- (void)_setCustomHierarchy:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomHierarchy:", v5);

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  -[VNSceneClassificationRequest customHierarchy](self, "customHierarchy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHierarchy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = VisionCoreEqualOrNilObjects();

  if ((v7 & 1) != 0
    && (v8 = -[VNSceneClassificationRequest maximumLeafObservations](self, "maximumLeafObservations"),
        v8 == objc_msgSend(v4, "maximumLeafObservations"))
    && (v9 = -[VNSceneClassificationRequest maximumHierarchicalObservations](self, "maximumHierarchicalObservations"),
        v9 == objc_msgSend(v4, "maximumHierarchicalObservations"))
    && ((v10 = objc_msgSend(v4, "resolvedRevision"), v10 == 2) || v10 == 3737841665)
    && (objc_msgSend(v4, "sceneObservation"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11)
    && (v12 = -[VNRequest detectionLevel](self, "detectionLevel"), v12 == objc_msgSend(v4, "detectionLevel")))
  {
    v15.receiver = self;
    v15.super_class = (Class)VNSceneClassificationRequest;
    v13 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v15, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNSceneClassificationRequest;
  -[VNRequest resolvedRevisionDidChangeFromRevision:](&v7, sel_resolvedRevisionDidChangeFromRevision_, a3);
  -[VNSceneClassificationRequest customHierarchy](self, "customHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "requestRevision");
    if (v6 != -[VNRequest resolvedRevision](self, "resolvedRevision"))
      -[VNSceneClassificationRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", 0);
  }

}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNSceneClassificationRequest *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = (VNSceneClassificationRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNSceneClassificationRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v7, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNSceneClassificationRequest sceneObservation](v4, "sceneObservation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNSceneClassificationRequest setSceneObservation:](self, "setSceneObservation:", v5);

      -[VNSceneClassificationRequest customHierarchy](v4, "customHierarchy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNSceneClassificationRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", v6);

      -[VNSceneClassificationRequest setMaximumLeafObservations:](self, "setMaximumLeafObservations:", -[VNSceneClassificationRequest maximumLeafObservations](v4, "maximumLeafObservations"));
      -[VNSceneClassificationRequest setMaximumHierarchicalObservations:](self, "setMaximumHierarchicalObservations:", -[VNSceneClassificationRequest maximumHierarchicalObservations](v4, "maximumHierarchicalObservations"));
    }
  }

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
  VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  VNImageAnalyzerMultiDetectorSceneClassificationConfiguration *v13;
  void *v14;
  id v15;
  id v16;
  objc_super v18;
  VNImageAnalyzerMultiDetectorSceneClassificationConfiguration *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VNSceneClassificationRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v18, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v7, a3))
  {
    v8 = -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration initWithObservationsRecipient:]([VNCoreSceneUnderstandingDetectorImageClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));

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

      v13 = -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSceneClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
      v19 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));

      v15 = v6;
    }
    else
    {
      v16 = v6;
    }
  }

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  if (a3 == 3737841665 || a3 == 2)
  {
    if (a5)
    {
      +[VNError errorForUnsupportedConfigurationOfRequest:](VNError, "errorForUnsupportedConfigurationOfRequest:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      *a5 = v9;
    }
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  return 0;
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
        objc_msgSend(v11, "allSceneIdentifiersWithOptions:error:", v9, a3);
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
  -[objc_class allClassificationIdentifiersWithConfigurationOptions:error:](v6, "allClassificationIdentifiersWithConfigurationOptions:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v9 = v7;
LABEL_13:

  return v8;
}

- (VNSceneObservation)sceneObservation
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneObservation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNSceneObservation *)v3;
}

- (void)setSceneObservation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneObservation:", v5);

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
    -[VNSceneClassificationRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", 0);
    goto LABEL_5;
  }
  v7 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v8 = objc_msgSend(v6, "requestRevision");
  if (v7 == v8)
  {
    -[VNSceneClassificationRequest _setCustomHierarchy:](self, "_setCustomHierarchy:", v6);
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

    if (v9
      && -[VNSceneClassificationRequest defineCustomHierarchy:error:](self, "defineCustomHierarchy:error:", v9, a4))
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

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNSceneClassificationRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
