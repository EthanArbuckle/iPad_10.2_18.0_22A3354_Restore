@implementation VNImageAnalyzerCompoundRequest

+ (void)_evaluateOriginalVNGenerateObjectnessBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorSaliencyOConfiguration *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSaliencyOConfiguration alloc], "initWithObservationsRecipient:", v8);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"), v6);

}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  VNImageAnalyzerCompoundRequestGroupingConfigurations *v15;
  id *p_isa;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  id v35;
  VNImageAnalyzerCompoundRequestGroupingConfigurations *v36;
  id v37;
  id v38;
  id *v39;
  id v40;
  objc_class *v41;
  id v42;
  id obj;
  _QWORD block[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[136];
  VNImageAnalyzerCompoundRequestGroupingConfigurations *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v35 = a4;
  v36 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations initWithDetectorModel:]([VNImageAnalyzerCompoundRequestGroupingConfigurations alloc], "initWithDetectorModel:", 1);
  v58 = v36;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v37;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v46;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "frameworkClass");
        v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v11, objc_msgSend(v10, "resolvedRevision"));
        if (v12)
        {
          v13 = *(_QWORD *)&v57[8 * v12 + 128];
          if (v13)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __98__VNImageAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0l;
            block[4] = a1;
            if (+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken != -1)
              dispatch_once(&+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMapOnceToken, block);
            v14 = std::__hash_table<std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::__unordered_map_hasher<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::hash<objc_class * {__strong}>,std::equal_to<objc_class * {__strong}>,true>,std::__unordered_map_equal<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::equal_to<objc_class * {__strong}>,std::hash<objc_class * {__strong}>,true>,std::allocator<std::__hash_value_type<objc_class * {__strong},objc_selector *>>>::find<objc_class * {__strong}>((_QWORD *)+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap, v11);
            if (v14)
              objc_msgSend(a1, "performSelector:withObject:withObject:", v14[3], v10, v13);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v7);
  }

  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = v36;
  p_isa = (id *)&v15->super.isa;
  v39 = (id *)&v15->super.isa;
  if (v15)
  {
    v17 = -[NSMutableDictionary count](v15->_groupingConfigurations, "count");
    p_isa = v39;
    if (v17)
    {
      objc_msgSend(v39[1], "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "copy");

      v20 = v19;
      v42 = v38;
      v41 = (objc_class *)objc_opt_self();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v40 = v20;
      v21 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v54 != v22)
              objc_enumerationMutation(v40);
            v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"), v25);

            v26 = (void *)objc_msgSend([v41 alloc], "initWithDetectorType:groupingConfiguration:", CFSTR("VNImageAnalyzerMultiDetectorType"), v24);
            objc_msgSend(v24, "computeStageDeviceAssignments");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v28 = v27;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v50;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v50 != v30)
                    objc_enumerationMutation(v28);
                  v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
                  objc_msgSend(v28, "objectForKeyedSubscript:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setComputeDevice:forComputeStage:", v33, v32);

                }
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
              }
              while (v29);
            }

            objc_msgSend(v42, "addObject:", v26);
          }
          v21 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        }
        while (v21);
      }

      p_isa = v39;
    }
  }

  return v38;
}

+ (id)publicRevisionsSet
{
  if (+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::onceToken, &__block_literal_global_3243);
  return (id)+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::supportedRevisions;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (VNImageAnalyzerCompoundRequest)initWithDetectorType:(id)a3 groupingConfiguration:(id)a4
{
  id v6;
  void *v7;
  VNImageAnalyzerCompoundRequest *v8;
  VNImageAnalyzerCompoundRequest *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  objc_msgSend(v6, "originalRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)VNImageAnalyzerCompoundRequest;
  v8 = -[VNCompoundRequest initWithOriginalRequests:](&v24, sel_initWithOriginalRequests_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupingConfiguration, a4);
    -[VNRequest configuration](v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDetectorType:", v19);
    objc_msgSend(v6, "detectorConfigurationOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDetectorConfigurationOptions:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "configuration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(v10, "setOriginalRequestConfigurations:", v12);
  }

  return v9;
}

void __98__VNImageAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1)
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
  +[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap = v2;
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
            std::__hash_table<std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::__unordered_map_hasher<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::hash<objc_class * {__strong}>,std::equal_to<objc_class * {__strong}>,true>,std::__unordered_map_equal<objc_class * {__strong},std::__hash_value_type<objc_class * {__strong},objc_selector *>,std::equal_to<objc_class * {__strong}>,std::hash<objc_class * {__strong}>,true>,std::allocator<std::__hash_value_type<objc_class * {__strong},objc_selector *>>>::__emplace_unique_key_args<objc_class * {__strong},std::piecewise_construct_t const&,std::tuple<objc_class * const {__strong}&>,std::tuple<>>((uint64_t *)+[VNImageAnalyzerCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:]::originalRequestClassToSelectorMap, (unint64_t)v10, (id *)&v11)[3] = Name;

        }
      }
    }
    free(v5);
  }
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNImageAnalyzerCompoundRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  -[VNRequest configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorConfigurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
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

void __52__VNImageAnalyzerCompoundRequest_publicRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 1, 1);
  v1 = (void *)+[VNImageAnalyzerCompoundRequest publicRevisionsSet]::supportedRevisions;
  +[VNImageAnalyzerCompoundRequest publicRevisionsSet]::supportedRevisions = v0;

}

- (unint64_t)networkModel
{
  VNImageAnalyzerCompoundRequestGroupingConfiguration *groupingConfiguration;

  groupingConfiguration = self->_groupingConfiguration;
  if (groupingConfiguration)
    return groupingConfiguration->_detectorModel;
  else
    return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 1;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id obj;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)VNImageAnalyzerCompoundRequest;
  v29 = a3;
  if (-[VNRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v34, sel_willAcceptCachedResultsFromRequestWithConfiguration_))
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v4;
    objc_msgSend(v4, "detectorType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "detectorType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0
      && (objc_msgSend(v4, "detectorConfigurationOptions"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v29, "detectorConfigurationOptions"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToDictionary:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      objc_msgSend(v29, "originalRequestConfigurations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v11, "mutableCopy");

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[VNCompoundRequest originalRequests](self, "originalRequests");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(obj);
            v15 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
            v16 = v28;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            if (v18)
            {
              v19 = 0;
              v20 = *(_QWORD *)v36;
              while (2)
              {
                v21 = 0;
                v22 = v18 + v19;
                do
                {
                  if (*(_QWORD *)v36 != v20)
                    objc_enumerationMutation(v17);
                  if ((objc_msgSend(v15, "willAcceptCachedResultsFromRequestWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v21)) & 1) != 0)
                  {
                    v23 = v19 + v21;
                    goto LABEL_19;
                  }
                  ++v21;
                }
                while (v18 != v21);
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
                v19 = v22;
                if (v18)
                  continue;
                break;
              }
              v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
              v4 = v27;
            }
            else
            {
              v23 = 0x7FFFFFFFFFFFFFFFLL;
            }

            if (v23 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v24 = 0;
              goto LABEL_28;
            }
            objc_msgSend(v17, "removeObjectAtIndex:", v23);
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v12)
            continue;
          break;
        }
      }
      v24 = 1;
LABEL_28:

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  VNImageAnalyzerCompoundRequestGroupingConfiguration *groupingConfiguration;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v62;
  void *v63;
  id v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v64, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v64;
    if (v10)
    {
      v65[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v13 = objc_msgSend(v8, "qosClass");
      -[VNCompoundRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v13, v11, self, a5, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;
      if (v14)
      {
        -[VNRequest setResults:](self, "setResults:", v14);
        -[VNCompoundRequest recordWarningsInOriginalRequests](self, "recordWarningsInOriginalRequests");
        groupingConfiguration = self->_groupingConfiguration;
        v62 = v8;
        if (groupingConfiguration)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _recordResultsInObservationsRecipients(v17, v62);

          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"));
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v62;
          if (v18)
          {
            objc_msgSend(v18, "observationsRecipient");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "cacheObservationsOfRequest:", v20);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          _recordResultsInObservationsRecipients(v21, v19);

          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_CompressedSceneprintConfiguration"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = v19;
          if (v22)
          {
            objc_msgSend(v22, "observationsRecipient");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "cacheObservationsOfRequest:", v24);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_AestheticsConfiguration"));
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v26 = v23;
          if (v25)
          {
            objc_msgSend(v25, "observationsRecipient");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "cacheObservationsOfRequest:", v27);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"));
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = v26;
          if (v28)
          {
            objc_msgSend(v28, "observationsRecipient");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "cacheObservationsOfRequest:", v30);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"));
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = v29;
          if (v31)
          {
            objc_msgSend(v31, "observationsRecipient");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "cacheObservationsOfRequest:", v33);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"));
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v35 = v32;
          if (v34)
          {
            objc_msgSend(v34, "observationsRecipient");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "cacheObservationsOfRequest:", v36);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"));
          v37 = (id)objc_claimAutoreleasedReturnValue();
          v38 = v35;
          if (v37)
          {
            objc_msgSend(v37, "observationsRecipient");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "cacheObservationsOfRequest:", v39);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_ImageFingerprintsConfiguration"));
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v41 = v38;
          if (v40)
          {
            objc_msgSend(v40, "observationsRecipient");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "cacheObservationsOfRequest:", v42);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_JunkConfiguration"));
          v43 = (id)objc_claimAutoreleasedReturnValue();
          v44 = v41;
          if (v43)
          {
            objc_msgSend(v43, "observationsRecipient");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "cacheObservationsOfRequest:", v45);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"));
          v46 = (id)objc_claimAutoreleasedReturnValue();
          v47 = v44;
          if (v46)
          {
            objc_msgSend(v46, "observationsRecipient");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "cacheObservationsOfRequest:", v48);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"));
          v49 = (id)objc_claimAutoreleasedReturnValue();
          v50 = v47;
          if (v49)
          {
            objc_msgSend(v49, "observationsRecipient");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "cacheObservationsOfRequest:", v51);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"));
          v52 = (id)objc_claimAutoreleasedReturnValue();
          v53 = v50;
          if (v52)
          {
            objc_msgSend(v52, "observationsRecipient");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "cacheObservationsOfRequest:", v54);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"));
          v55 = (id)objc_claimAutoreleasedReturnValue();
          v56 = v53;
          if (v55)
          {
            objc_msgSend(v55, "observationsRecipient");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "cacheObservationsOfRequest:", v57);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](groupingConfiguration->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"));
          v58 = (id)objc_claimAutoreleasedReturnValue();
          v59 = v56;
          if (v58)
          {
            objc_msgSend(v58, "observationsRecipient");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "cacheObservationsOfRequest:", v60);

          }
        }

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingConfiguration, 0);
}

+ (void)_evaluateOriginalVNClassifyImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = objc_msgSend(v12, "resolvedRevision");
  +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", objc_msgSend(v12, "frameworkClass"), v6);
  if (v6 == 3737841667)
  {
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration alloc], "initWithObservationsRecipient:", v12);
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setMaximumLabels:](v8, "setMaximumLabels:", objc_msgSend(v12, "maximumLeafObservations"));
    objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"), v8);
  }
  else
  {
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSceneConfigurationForOriginalRequest:", v12);
    v8 = (VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration *)objc_claimAutoreleasedReturnValue();
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setMaximumLeafLabels:](v8, "setMaximumLeafLabels:", objc_msgSend(v12, "maximumLeafObservations"));
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setMaximumHierarchicalLabels:](v8, "setMaximumHierarchicalLabels:", objc_msgSend(v12, "maximumHierarchicalObservations"));
    objc_msgSend(v12, "customHierarchy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration setCustomHierarchy:](v8, "setCustomHierarchy:", v9);

    objc_msgSend(v7, "addTilingWarningRecorder:", v12);
  }
  v10 = v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "imageCropAndScaleOption"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v11);

}

+ (void)_evaluateOriginalVNSceneClassificationRequest:(id)a3 configurations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v10, "sceneObservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTilingWarningRecorder:", v10);
    objc_msgSend(v7, "addSceneConfigurationForOriginalRequest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaximumLeafLabels:", objc_msgSend(v10, "maximumLeafObservations"));
    objc_msgSend(v8, "setMaximumHierarchicalLabels:", objc_msgSend(v10, "maximumHierarchicalObservations"));
    objc_msgSend(v10, "customHierarchy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCustomHierarchy:", v9);

  }
}

+ (void)_evaluateOriginalVNCreateSceneprintRequest:(id)a3 configurations:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = objc_msgSend(v12, "returnAllResults");
  v7 = objc_msgSend(v12, "resolvedRevision");
  if (v7 == 3737841666)
  {
    v8 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration alloc], "initWithObservationsRecipient:", v12);
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_CompressedSceneprintConfiguration"), v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "imageCropAndScaleOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v10);

  }
  else
  {
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v12, 0);
    v8 = (VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration *)objc_claimAutoreleasedReturnValue();
    -[VNImageAnalyzerMultiDetectorCompressedSceneprintConfiguration addSceneprintConfigurationForOriginalRequest:](v8, "addSceneprintConfigurationForOriginalRequest:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if ((unint64_t)(v7 - 2) < 2 || v7 == 3737841671)
      objc_msgSend(v11, "setIncludeLabelsAndConfidences:", v6);
  }

}

+ (void)_evaluateOriginalVNGenerateImageFeaturePrintRequest:(id)a3 configurations:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)a4, v6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSceneprintConfigurationForOriginalRequest:", v6);

}

+ (void)_evaluateOriginalVNClassifyImageAestheticsRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorAestheticsConfiguration *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "resolvedRevision") != 1
    || !objc_msgSend(v8, "detectionLevel")
    || objc_msgSend(v5, "detectorModel") != 1)
  {
    v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorAestheticsConfiguration alloc], "initWithObservationsRecipient:", v8);
    -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_AestheticsConfiguration"), v6);

  }
}

+ (void)_evaluateOriginalVNGenerateAttentionBasedSaliencyImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorSaliencyAConfiguration *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSaliencyAConfiguration alloc], "initWithObservationsRecipient:", v8);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"), v6);

}

+ (void)_evaluateOriginalVNClassifyJunkImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorJunkClassificationConfiguration *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorJunkClassificationConfiguration alloc], "initWithObservationsRecipient:", v9);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_JunkConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v8);

}

+ (void)_evaluateOriginalVNVYvzEtX1JlUdu8xx5qhDI:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorVNVYvzEtX1JlUdu8xx5qhDIConfiguration *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVNVYvzEtX1JlUdu8xx5qhDIConfiguration alloc], "initWithObservationsRecipient:", v9);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v8);

}

+ (void)_evaluateOriginalVNRecognizeObjectsRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration alloc], "initWithObservationsRecipient:", v10);
  objc_msgSend(v10, "modelMinimumDetectionConfidence");
  -[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration setMinimumDetectionConfidence:](v6, "setMinimumDetectionConfidence:");
  objc_msgSend(v10, "modelNonMaximumSuppressionThreshold");
  -[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration setNonMaximumSuppressionThreshold:](v6, "setNonMaximumSuppressionThreshold:");
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v10, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"), MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "useImageAnalyzerScaling"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorProcessingOption_SkipInputImageScaling"), v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "imageCropAndScaleOption"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v9);

}

+ (void)_evaluateOriginalVNClassifyPotentialLandmarkRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorPotentialLandmarkClassificationConfiguration *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorPotentialLandmarkClassificationConfiguration alloc], "initWithObservationsRecipient:", v9);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v8);

}

+ (void)_evaluateOriginalVN5kJNH3eYuyaLxNpZr5Z7zi:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration alloc], "initWithObservationsRecipient:", v9);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v8);

}

+ (void)_evaluateOriginalVN6Mb1ME89lyW3HpahkEygIG:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorVN6Mb1ME89lyW3HpahkEygIGConfiguration *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVN6Mb1ME89lyW3HpahkEygIGConfiguration alloc], "initWithObservationsRecipient:", v9);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v8);

}

+ (void)_evaluateOriginalVNClassifyCityNatureImageRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorCityNatureClassificationConfiguration *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorCityNatureClassificationConfiguration alloc], "initWithObservationsRecipient:", v9);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v9, 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"), v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "imageCropAndScaleOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v8);

}

+ (void)_evaluateOriginalVN1JC7R3k4455fKQz0dY1VhQ:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorVN1JC7R3k4455fKQz0dY1VhQConfiguration *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorVN1JC7R3k4455fKQz0dY1VhQConfiguration alloc], "initWithObservationsRecipient:", v8);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"), MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"), v6);

}

+ (void)_evaluateOriginalVNCreateImageFingerprintsRequest:(id)a3 configurations:(id)a4
{
  id v5;
  VNImageAnalyzerMultiDetectorImageFingerprintsConfiguration *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorImageFingerprintsConfiguration alloc], "initWithObservationsRecipient:", v8);
  -[VNImageAnalyzerCompoundRequestGroupingConfigurations groupingConfigurationForRequest:kind:]((uint64_t)v5, v8, 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNImageAnalyzerMultiDetectorOption_ImageFingerprintsConfiguration"), v6);

}

@end
