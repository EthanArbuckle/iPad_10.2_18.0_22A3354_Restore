@implementation VNCoreSceneUnderstandingCompoundRequest

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v21;
  VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = a4;
  v22 = objc_alloc_init(VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16, v7);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "frameworkClass");
        if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:revision:](VNCoreSceneUnderstandingDetector, "handlesRequestClass:revision:", v12, objc_msgSend(v11, "resolvedRevision")))
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __107__VNCoreSceneUnderstandingCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0l;
          block[4] = a1;
          if (+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken != -1)
            dispatch_once(&+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken, block);
          v13 = std::__hash_table<std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::__unordered_map_hasher<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::hash<objc_class * {__strong}>,std::equal_to<objc_class * {__strong}>,true>,std::__unordered_map_equal<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::equal_to<objc_class * {__strong}>,std::hash<objc_class * {__strong}>,true>,std::allocator<std::__hash_value_type<objc_class * {__strong},objc_selector *>>>::find<objc_class * {__strong}>((_QWORD *)+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap, v12);
          if (v13)
            objc_msgSend(a1, "performSelector:withObject:withObject:", v13[3], v11, v22);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations allConfigurations](v22, "allConfigurations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDetectorType:configuration:", CFSTR("VNCoreSceneUnderstandingDetectorType"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        objc_msgSend(v14, "addObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v16);
  }

  return v14;
}

- (VNCoreSceneUnderstandingCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  VNCoreSceneUnderstandingCompoundRequest *v8;
  VNCoreSceneUnderstandingCompoundRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  objc_msgSend(v6, "originalRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)VNCoreSceneUnderstandingCompoundRequest;
  v8 = -[VNCompoundRequest initWithOriginalRequests:](&v25, sel_initWithOriginalRequests_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_detectorConfiguration, a4);
    objc_msgSend(v6, "mainStageComputeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNRequest setComputeDevice:forComputeStage:](v9, "setComputeDevice:forComputeStage:", v10, CFSTR("VNComputeStageMain"));

    -[VNRequest configuration](v9, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDetectorType:", v20);
    objc_msgSend(v6, "detectorConfigurationOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDetectorConfigurationOptions:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "configuration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v15);
    }

    objc_msgSend(v11, "setOriginalRequestConfigurations:", v13);
  }

  return v9;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[VNRequest configuration](self, "configuration", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNCoreSceneUnderstandingCompoundRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  -[VNRequest configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorConfigurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
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
      -[VNCompoundRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 != 0;
      if (v15)
      {
        -[VNRequest setResults:](self, "setResults:", v15);
        -[VNCompoundRequest recordWarningsInOriginalRequests](self, "recordWarningsInOriginalRequests");
        -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration cacheResultsInRequestPerformingContext:](self->_detectorConfiguration, "cacheResultsInRequestPerformingContext:", v8);
      }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorConfiguration, 0);
}

+ (void)_evaluateOriginalVNClassifyImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_msgSend(v9, "resolvedRevision");
  if (v6 == 2 || v6 == 3737841666)
  {
    objc_msgSend(v5, "configurationForRequest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addImageClassificationConfigurationForOriginalRequest:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaximumLeafClassifications:", objc_msgSend(v9, "maximumLeafObservations"));
    objc_msgSend(v8, "setMaximumHierarchicalClassifications:", objc_msgSend(v9, "maximumHierarchicalObservations"));
    goto LABEL_6;
  }
  if (v6 == 3737841667)
  {
    objc_msgSend(v5, "configurationForRequest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntityNetClassificationConfigurationForOriginalRequest:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaximumClassifications:", objc_msgSend(v9, "maximumLeafObservations"));
LABEL_6:

  }
}

+ (void)_evaluateOriginalVNSceneClassificationRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "sceneObservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && objc_msgSend(v9, "resolvedRevision") == 3737841665)
  {
    objc_msgSend(v5, "configurationForRequest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addImageClassificationConfigurationForOriginalRequest:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaximumLeafClassifications:", objc_msgSend(v9, "maximumLeafObservations"));
    objc_msgSend(v8, "setMaximumHierarchicalClassifications:", objc_msgSend(v9, "maximumHierarchicalObservations"));

  }
}

+ (void)_evaluateOriginalVNCreateSceneprintRequest:(id)a3 configurations:(id)a4
{
  id v5;
  uint64_t v6;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_msgSend(v10, "resolvedRevision");
  if ((unint64_t)(v6 - 3737841671) < 2 || v6 == 3)
  {
    objc_msgSend(v5, "configurationForRequest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "addSceneprintConfigurationForOriginalRequest:", v10);

  }
}

+ (void)_evaluateOriginalVNGenerateImageFeaturePrintRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "resolvedRevision") == 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addSceneprintConfigurationForOriginalRequest:", v8);

  }
}

+ (void)_evaluateOriginalVNClassifyImageAestheticsRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if ((unint64_t)(objc_msgSend(v8, "resolvedRevision") - 3737841667) < 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addImageAestheticsConfigurationForOriginalRequest:", v8);

  }
}

+ (void)_evaluateOriginalVNGenerateAttentionBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  uint64_t v6;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_msgSend(v10, "resolvedRevision");
  if ((unint64_t)(v6 - 3737841667) < 2 || v6 == 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "addImageSaliencyAConfigurationForOriginalRequest:", v10);

  }
}

+ (void)_evaluateOriginalVNGenerateObjectnessBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_msgSend(v9, "resolvedRevision");
  if (v6 == 2 || v6 == 3737841666)
  {
    objc_msgSend(v5, "configurationForRequest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "addImageSaliencyOConfigurationForOriginalRequest:", v9);

  }
}

+ (void)_evaluateOriginalVNRecognizeObjectsRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "resolvedRevision") == 3737841667)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRecognizeObjectsConfigurationForOriginalRequest:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelMinimumDetectionConfidence");
    objc_msgSend(v7, "setMinimumDetectionConfidence:");
    objc_msgSend(v8, "modelNonMaximumSuppressionThreshold");
    objc_msgSend(v7, "setNonMaximumSuppressionThreshold:");

  }
}

+ (void)_evaluateOriginalVNCreateImageFingerprintsRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "resolvedRevision") == 1)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addImageFingerprintsConfigurationForOriginalRequest:", v8);

  }
}

+ (void)_evaluateOriginalVNClassifyJunkImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if ((unint64_t)(objc_msgSend(v8, "resolvedRevision") - 3737841669) < 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addJunkConfigurationForOriginalRequest:", v8);

  }
}

+ (void)_evaluateOriginalVN5kJNH3eYuyaLxNpZr5Z7zi:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if ((unint64_t)(objc_msgSend(v8, "resolvedRevision") - 3737841667) < 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addVN5kJNH3eYuyaLxNpZr5Z7ziConfigurationForOriginalRequest:", v8);

  }
}

+ (void)_evaluateOriginalVN6Mb1ME89lyW3HpahkEygIG:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "resolvedRevision") == 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addSignificantEventConfigurationForOriginalRequest:", v8);

  }
}

+ (void)_evaluateOriginalVNClassifyCityNatureImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "resolvedRevision") == 2)
  {
    objc_msgSend(v5, "configurationForRequest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addCityNatureConfigurationForOriginalRequest:", v8);

  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

void __107__VNCoreSceneUnderstandingCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_class *Class;
  Method *v4;
  Method *v5;
  unint64_t i;
  const char *Name;
  void *v8;
  NSString *v9;
  Class v10;
  Class v11;
  unsigned int outCount;

  v2 = operator new();
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_DWORD *)(v2 + 32) = 1065353216;
  +[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap = v2;
  outCount = 0;
  Class = object_getClass(*(id *)(a1 + 32));
  v4 = class_copyMethodList(Class, &outCount);
  if (v4)
  {
    v5 = v4;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        Name = method_getName(v5[i]);
        NSStringFromSelector(Name);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("_evaluateOriginal"))
          && objc_msgSend(v8, "hasSuffix:", CFSTR(":configurations:")))
        {
          objc_msgSend(v8, "substringWithRange:", 17, objc_msgSend(v8, "length") - 33);
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          v10 = NSClassFromString(v9);
          v11 = v10;
          if (v10)
            std::__hash_table<std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::__unordered_map_hasher<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::hash<objc_class * {__strong}>,std::equal_to<objc_class * {__strong}>,true>,std::__unordered_map_equal<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::equal_to<objc_class * {__strong}>,std::hash<objc_class * {__strong}>,true>,std::allocator<std::__hash_value_type<objc_class * {__strong},objc_selector *>>>::__emplace_unique_key_args<objc_class * {__strong},std::piecewise_construct_t const&,std::tuple<objc_class * const {__strong}&>,std::tuple<>>((uint64_t *)+[VNCoreSceneUnderstandingCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap, (unint64_t)v10, (id *)&v11)[3] = Name;

        }
      }
    }
    free(v5);
  }
}

@end
