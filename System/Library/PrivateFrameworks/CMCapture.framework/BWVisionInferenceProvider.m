@implementation BWVisionInferenceProvider

- (NSArray)outputVideoRequirements
{
  return &self->_outputVideoRequirements->super;
}

- (NSArray)inputVideoRequirements
{
  return &self->_inputVideoRequirements->super;
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (id)bindOutputForRequest:(id)a3 asMetadataUsingKey:(id)a4
{
  BWInferenceMetadataRequirement *v7;
  BWInferenceMetadataRequirement *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = [BWInferenceMetadataRequirement alloc];
  v10[0] = a4;
  v8 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:](v7, "initWithMetadataKeys:mappingOption:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), 1);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v8);
  return v8;
}

- (id)bindInputForRequest:(id)a3 fromAttachedMediaUsingKey:(id)a4 preparedByAttachedMediaKey:(id)a5 withVideoFormatProvider:(id)a6
{
  BWInferenceLazyVideoRequirement *v8;

  v8 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", a4, a4, a6);
  -[NSMutableArray addObject:](self->_inputVideoRequirements, "addObject:", v8);
  if (!-[BWVisionInferenceProvider primaryInputVideoRequirement](self, "primaryInputVideoRequirement")
    && -[NSString isEqualToString:](-[BWInferenceMediaRequirement attachedMediaKey](v8, "attachedMediaKey"), "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWVisionInferenceProvider setPrimaryInputVideoRequirement:](self, "setPrimaryInputVideoRequirement:", v8);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v8);
  return v8;
}

- (BWInferenceVideoRequirement)primaryInputVideoRequirement
{
  return self->_primaryInputVideoRequirement;
}

- (void)setPrimaryInputVideoRequirement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (BWVisionInferenceProvider)initWithConfiguration:(id)a3 requests:(id)a4 executesRequestsIndividually:(BOOL)a5 executionTarget:(int)a6 preventionReasons:(id)a7 resourceProvider:(id)a8
{
  uint64_t v10;
  BWVisionInferenceProvider *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *p_indexOfRequestForMergedFoodAndDrinkRecognition;
  char isKindOfClass;
  objc_super v22;

  v10 = *(_QWORD *)&a6;
  v22.receiver = self;
  v22.super_class = (Class)BWVisionInferenceProvider;
  v14 = -[BWVisionInferenceProvider init](&v22, sel_init);
  if (v14)
  {
    v14->_configuration = (BWVisionInferenceConfiguration *)a3;
    objc_opt_class();
    v15 = (objc_opt_isKindOfClass() & 1) != 0 ? a3 : 0;
    v14->_executesRequestsIndividually = a5;
    v14->_type = objc_msgSend(a3, "inferenceType");
    v14->_executionTarget = v10;
    v16 = objc_msgSend(a7, "copy");
    *(int64x2_t *)&v14->_indexOfRequestForMergedFaceDetection = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v14->_preventionReasons = (NSSet *)v16;
    v14->_indexOfRequestForMaximumNumberOfFaces = 0x7FFFFFFFFFFFFFFFLL;
    v14->_maximumNumberOfFaces = objc_msgSend(v15, "maximumNumberOfFaces");
    v14->_clampToLargestMaximumNumberOfFaces = objc_msgSend(v15, "clampToLargestMaximumNumberOfFaces");
    v14->_considerISPRectsIfVisionFails = objc_msgSend(v15, "considerISPRectsIfVisionFails");
    v14->_alwaysExecuteForRedEyeReduction = objc_msgSend(v15, "alwaysExecuteForRedEyeReduction");
    v14->_prototypeRequests = (NSArray *)objc_msgSend(a4, "copy");
    v14->_context = (BWVisionInferenceContext *)(id)objc_msgSend(a8, "visionContextForExecutionTarget:", v10);
    v14->_requestIndexByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14->_requestIndexByRequest = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(a4, "count"));
    if (objc_msgSend(a4, "count"))
    {
      v17 = 0;
      while (1)
      {
        v18 = objc_msgSend(a4, "objectAtIndexedSubscript:", v17);
        -[NSMapTable setObject:forKey:](v14->_requestIndexByRequest, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17), v18);
        getVNDetectFaceRectanglesRequestClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        getVNRecognizeFoodAndDrinkRequestClass();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        p_indexOfRequestForMergedFoodAndDrinkRecognition = &v14->_indexOfRequestForMergedFoodAndDrinkRecognition;
        if ((isKindOfClass & 1) != 0)
          goto LABEL_10;
LABEL_11:
        if (++v17 >= objc_msgSend(a4, "count"))
          return v14;
      }
      v14->_indexOfRequestForMaximumNumberOfFaces = v17;
      p_indexOfRequestForMergedFoodAndDrinkRecognition = &v14->_indexOfRequestForMergedFaceDetection;
LABEL_10:
      *p_indexOfRequestForMergedFoodAndDrinkRecognition = v17;
      goto LABEL_11;
    }
  }
  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceProvider;
  -[BWVisionInferenceProvider dealloc](&v3, sel_dealloc);
}

- (id)newStorage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v3, "addObjectsFromArray:", self->_inputVideoRequirements);
  objc_msgSend(v3, "addObjectsFromArray:", self->_outputVideoRequirements);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "addObjectsFromArray:", self->_outputVideoRequirements);
  return -[BWVisionInferenceStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:]([BWVisionInferenceStorage alloc], "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v3, v4);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  NSMutableArray *outputVideoRequirements;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const void *v16;
  NSMutableArray *cloneVideoRequirements;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  const void *v23;
  NSMutableArray *outputMetadataRequirements;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(outputVideoRequirements);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v16 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", v15, a6);
        BWSampleBufferSetAttachedMedia(a6, objc_msgSend(v15, "attachedMediaKey"), (uint64_t)v16);
        if (v16)
          CFRelease(v16);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v12);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(cloneVideoRequirements);
        v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v23 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingCloneRequirement:", v22);
        BWSampleBufferSetAttachedMedia(a6, objc_msgSend(v22, "attachedMediaKey"), (uint64_t)v23);
        if (v23)
          CFRelease(v23);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  outputMetadataRequirements = self->_outputMetadataRequirements;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(outputMetadataRequirements);
        v29 = (void *)objc_msgSend(a4, "newMetadataDictionarySatisfyingRequirement:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
        objc_msgSend(a3, "addEntriesFromDictionary:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v26);
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (void)_tapToRadarVisionTimeOutError:(uint64_t)a3 performingRequests:(uint64_t)a4 settingsID:
{
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Vision] %@ encountered Vision time out with err:%d while processing %@"), v7, objc_msgSend(a2, "code"), a3);
    FigCapturePromptOpenTapToRadar((uint64_t)CFSTR("Vision time out detected. Please file a radar."), v8, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encountered Vision time out for captureID:%lld with err:%@, while performing requests %@. {Please embellish with any details about the scene, subject, or other such information}"), a4, a2, a3), 3, 6, 6, 0.0);
  }
}

- (int)prepareForExecution
{
  _DWORD *v3;
  int v4;
  VNSequenceRequestHandler *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v7;
  _QWORD v9[23];

  v9[22] = *MEMORY[0x1E0C80C00];
  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  BWInferenceTypeDescription(self->_type);
  mach_absolute_time();
  v4 = -[BWVisionInferenceContext prepareForInference](self->_context, "prepareForInference");
  if (v4)
  {
    v7 = v4;
  }
  else
  {
    v5 = -[BWVisionInferenceContext sequenceRequestHandler](self->_context, "sequenceRequestHandler");
    if (v5)
    {
      v9[0] = 0;
      if (-[VNSequenceRequestHandler prepareForPerformingRequests:error:](v5, "prepareForPerformingRequests:error:", self->_prototypeRequests, v9))
      {
        if (dword_1ECFE99B0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v7 = 0;
      }
      else
      {
        v7 = -31710;
      }
    }
    else
    {
      v7 = -31702;
    }
  }
  if (*v3 == 1)
    kdebug_trace();
  return v7;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  _DWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableDictionary *requestIndexByRequirement;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  unsigned int (**v30)(id, id, opaqueCMSampleBuffer *);
  uint64_t AttachedInference;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  BWInferenceVideoRequirement *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  _QWORD *v57;
  id v58;
  unsigned int (*v59)(_QWORD *, id, opaqueCMSampleBuffer *);
  _QWORD *v60;
  BWInferenceVideoRequirement *v61;
  NSMutableArray *inputVideoRequirements;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  BWInferenceVideoRequirement *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  _BOOL4 v73;
  uint64_t v74;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  opaqueCMSampleBuffer *v81;
  int v82;
  VNSequenceRequestHandler *v83;
  unsigned int v84;
  uint64_t v85;
  BOOL v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  void *v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!-[BWVisionInferenceProvider primaryInputVideoRequirement](self, "primaryInputVideoRequirement"))
  {
    FigDebugAssert3();
    v23 = 0;
    v74 = 4294935585;
    goto LABEL_124;
  }
  v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v11 || (v12 = v11, (v13 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50])) == 0))
  {
    FigDebugAssert3();
    v23 = 0;
    v74 = 4294935582;
    goto LABEL_124;
  }
  v84 = objc_msgSend(v13, "intValue");
  v14 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  v15 = (void *)objc_msgSend(v14, "captureStreamSettingsForPortType:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  v76 = v14;
  v77 = v12;
  v78 = a6;
  v86 = objc_msgSend(v14, "captureType") == 2
     && (objc_msgSend(v15, "captureFlags") & 0x10000) != 0
     && self->_alwaysExecuteForRedEyeReduction;
  v112 = 0;
  v83 = -[BWVisionInferenceContext sequenceRequestHandler](self->_context, "sequenceRequestHandler");
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_prototypeRequests, 1);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  requestIndexByRequirement = self->_requestIndexByRequirement;
  v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](requestIndexByRequirement, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v109 != v20)
          objc_enumerationMutation(requestIndexByRequirement);
        objc_msgSend(a4, "setRequest:forRequirement:", objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestIndexByRequirement, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i)), "unsignedIntegerValue")), *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i));
      }
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](requestIndexByRequirement, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
    }
    while (v19);
  }
  if (!self->_executesRequestsIndividually)
  {
    if (-[BWVisionInferenceConfiguration shouldPreventRequestForSampleBuffer](self->_configuration, "shouldPreventRequestForSampleBuffer"))
    {
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v114, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v93;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v93 != v27)
              objc_enumerationMutation(v16);
            v29 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
            v30 = -[BWVisionInferenceConfiguration shouldPreventRequestForSampleBuffer](self->_configuration, "shouldPreventRequestForSampleBuffer");
            if (v30[2](v30, (id)objc_msgSend(v29, "copy"), a3))
            {
              objc_msgSend(v24, "addObject:", v29);
              objc_msgSend(a4, "removeRequest:", v29);
            }
          }
          v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v114, 16);
        }
        while (v26);
      }
      objc_msgSend(v16, "removeObjectsInArray:", v24);
    }
    if (-[BWVisionInferenceConfiguration reuseUpstreamFaceObservations](self->_configuration, "reuseUpstreamFaceObservations"))
    {
      AttachedInference = BWInferenceGetAttachedInference(a3, 802, 0x1E4951058);
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v113, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v89;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v89 != v34)
              objc_enumerationMutation(v16);
            v36 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
            if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EE727C18))
              objc_msgSend(v36, "setInputFaceObservations:", AttachedInference);
          }
          v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v113, 16);
        }
        while (v33);
      }
    }
    v37 = -[BWVisionInferenceProvider primaryInputVideoRequirement](self, "primaryInputVideoRequirement");
    v38 = objc_msgSend(a4, "pixelBufferForRequirement:", v37);
    if (!v38)
    {
      v23 = 0;
      v74 = 4294935584;
      goto LABEL_120;
    }
    v39 = v38;
    if (-[BWInferenceVideoFormat deviceOriented](-[BWInferenceVideoRequirement videoFormat](v37, "videoFormat"), "deviceOriented"))
    {
      v40 = 1;
    }
    else
    {
      v40 = v84;
    }
    v41 = -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:orientation:error:](v83, "performRequests:onCVPixelBuffer:orientation:error:", v16, v39, v40, &v112);
    if (-[BWVisionInferenceConfiguration suppressTimeOutFailure](self->_configuration, "suppressTimeOutFailure")
      && objc_msgSend((id)objc_msgSend(v112, "domain"), "isEqualToString:", getVNErrorDomain())
      && objc_msgSend(v112, "code") == 20)
    {
      -[BWVisionInferenceProvider _tapToRadarVisionTimeOutError:performingRequests:settingsID:]((uint64_t)self, v112, (uint64_t)v16, objc_msgSend(v76, "settingsID"));
    }
    else if (!v41)
    {
      FigDebugAssert3();
      v23 = 0;
      v74 = 4294935586;
      goto LABEL_120;
    }
    v23 = 0;
LABEL_119:
    v74 = 0;
LABEL_120:
    a6 = v78;
    goto LABEL_123;
  }
  v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  if (self->_indexOfRequestForMergedFaceDetection == 0x7FFFFFFFFFFFFFFFLL
    || self->_indexOfRequestForMergedFoodAndDrinkRecognition == 0x7FFFFFFFFFFFFFFFLL)
  {
    v82 = 0;
    v23 = 0;
  }
  else
  {
    v23 = (id)objc_msgSend(v16, "objectAtIndexedSubscript:");
    v82 = 1;
  }
  v42 = objc_msgSend(v16, "count");
  if (!v42)
    goto LABEL_119;
  v43 = v42;
  v79 = v23;
  v80 = v22;
  v44 = 0;
  v45 = 0;
  v85 = v42;
  v81 = a3;
  while (1)
  {
    v46 = (void *)objc_msgSend(v16, "objectAtIndexedSubscript:", v44);
    if ((objc_msgSend(v22, "containsIndex:", v44) & 1) != 0)
      goto LABEL_117;
    v47 = (id)objc_msgSend(v45, "results");
    v87 = v46;
    if (self->_considerISPRectsIfVisionFails)
    {
      getVNDetectFaceRectanglesRequestClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v47, "count"))
      {
        v48 = (void *)BWFaceDetectionObservationsFromISPDetectedFacesMetadata(v77);
        if (objc_msgSend(v48, "count"))
          v47 = v48;
        v46 = v87;
      }
    }
    if (self->_clampToLargestMaximumNumberOfFaces)
    {
      getVNDetectFaceRectanglesRequestClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (getVNDetectFaceLandmarksRequestClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (getVNGenerateFaceSegmentsRequestClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (objc_msgSend(v47, "count") > self->_maximumNumberOfFaces)
        {
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v105;
            while (1)
            {
              if (*(_QWORD *)v105 != v51)
                objc_enumerationMutation(v47);
              if (!--v50)
              {
                v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
                if (!v50)
                  break;
              }
            }
          }
          v52 = (void *)objc_msgSend(v47, "sortedArrayUsingComparator:", &__block_literal_global_113);
          v47 = (id)objc_msgSend((id)objc_msgSend(v52, "subarrayWithRange:", objc_msgSend(v52, "count") - self->_maximumNumberOfFaces), "copy");
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v53 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v101;
            while (1)
            {
              if (*(_QWORD *)v101 != v55)
                objc_enumerationMutation(v47);
              if (!--v54)
              {
                v54 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
                if (!v54)
                  break;
              }
            }
          }
          v43 = v85;
          v46 = v87;
        }
      }
    }
    if (v45 && !objc_msgSend(v47, "count")
      || (!self->_maximumNumberOfFaces ? (v56 = 1) : (v56 = v86),
          (v56 & 1) == 0
       && !self->_clampToLargestMaximumNumberOfFaces
       && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", self->_indexOfRequestForMaximumNumberOfFaces), "results"), "count") > self->_maximumNumberOfFaces))
    {
LABEL_118:
      v74 = 0;
      goto LABEL_122;
    }
    if (-[BWVisionInferenceConfiguration shouldPreventRequestForSampleBuffer](self->_configuration, "shouldPreventRequestForSampleBuffer"))
    {
      v57 = -[BWVisionInferenceConfiguration shouldPreventRequestForSampleBuffer](self->_configuration, "shouldPreventRequestForSampleBuffer");
      v58 = (id)objc_msgSend(v87, "copy");
      v59 = (unsigned int (*)(_QWORD *, id, opaqueCMSampleBuffer *))v57[2];
      v60 = v57;
      v46 = v87;
      if (v59(v60, v58, a3))
      {
        objc_msgSend(a4, "removeRequest:", v87);
        goto LABEL_117;
      }
    }
    if (objc_msgSend(v46, "conformsToProtocol:", &unk_1EE727C18))
      objc_msgSend(v46, "setInputFaceObservations:", v47);
    v61 = -[BWVisionInferenceProvider primaryInputVideoRequirement](self, "primaryInputVideoRequirement");
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    inputVideoRequirements = self->_inputVideoRequirements;
    v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v97;
      do
      {
        for (m = 0; m != v64; ++m)
        {
          if (*(_QWORD *)v97 != v65)
            objc_enumerationMutation(inputVideoRequirements);
          v67 = *(BWInferenceVideoRequirement **)(*((_QWORD *)&v96 + 1) + 8 * m);
          if (v44 == (int)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestIndexByRequirement, "objectForKeyedSubscript:", v67), "intValue"))v61 = v67;
        }
        v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
      }
      while (v64);
    }
    v68 = objc_msgSend(a4, "pixelBufferForRequirement:", v61);
    if (!v68)
      break;
    v69 = v68;
    if (-[BWInferenceVideoFormat deviceOriented](-[BWInferenceVideoRequirement videoFormat](v61, "videoFormat"), "deviceOriented"))
    {
      v70 = 1;
    }
    else
    {
      v70 = v84;
    }
    v71 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v87);
    v72 = (uint64_t)v71;
    if (v82)
    {
      v22 = v80;
      a3 = v81;
      if (v44 == self->_indexOfRequestForMergedFaceDetection && v79)
      {
        objc_msgSend(v71, "addObject:", v79);
        objc_msgSend(v80, "addIndex:", self->_indexOfRequestForMergedFoodAndDrinkRecognition);

        v79 = 0;
      }
    }
    else
    {
      v22 = v80;
      a3 = v81;
    }
    v73 = -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:orientation:error:](v83, "performRequests:onCVPixelBuffer:orientation:error:", v72, v69, v70, &v112);
    if (-[BWVisionInferenceConfiguration suppressTimeOutFailure](self->_configuration, "suppressTimeOutFailure")
      && objc_msgSend((id)objc_msgSend(v112, "domain"), "isEqualToString:", getVNErrorDomain())
      && objc_msgSend(v112, "code") == 20)
    {
      -[BWVisionInferenceProvider _tapToRadarVisionTimeOutError:performingRequests:settingsID:]((uint64_t)self, v112, v72, objc_msgSend(v76, "settingsID"));
      v43 = v85;
      v44 = v85;
    }
    else
    {
      v43 = v85;
      if (!v73)
      {
        v74 = 4294935586;
        goto LABEL_122;
      }
    }
    v45 = v87;
LABEL_117:
    if (++v44 >= v43)
      goto LABEL_118;
  }
  v74 = 4294935584;
LABEL_122:
  a6 = v78;
  v23 = v79;
LABEL_123:
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_124:
  if (*v10 == 1)
    kdebug_trace();

  if (a6)
    (*((void (**)(id, uint64_t, BWVisionInferenceProvider *))a6 + 2))(a6, v74, self);
  return v74;
}

uint64_t __100__BWVisionInferenceProvider_executeOnSampleBuffer_usingStorage_withExecutionTime_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v4;
  float v5;
  uint64_t v6;

  v4 = bwvip_boundingBoxArea(a2);
  v5 = bwvip_boundingBoxArea(a3);
  if (v4 >= v5)
    v6 = 0;
  else
    v6 = -1;
  if (v4 > v5)
    return 1;
  else
    return v6;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD *v5;
  int v6;
  VNSequenceRequestHandler *v7;
  VNSequenceRequestHandler *v8;
  void *v9;
  void *v10;
  NSArray *prototypeRequests;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  int v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v6 = -[BWVisionInferenceContext prepareForInference](self->_context, "prepareForInference");
  if (v6)
  {
    v17 = v6;
  }
  else
  {
    v7 = -[BWVisionInferenceContext sequenceRequestHandler](self->_context, "sequenceRequestHandler");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = v9;
      if (v3)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        prototypeRequests = self->_prototypeRequests;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](prototypeRequests, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(prototypeRequests);
              v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              getVNDetectFaceRectanglesRequestClass();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v10, "addObject:", v16);
            }
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](prototypeRequests, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v13);
        }
      }
      else
      {
        objc_msgSend(v9, "addObjectsFromArray:", self->_prototypeRequests);
      }
      v19 = 0;
      if ((-[VNSequenceRequestHandler prepareForPerformingRequests:error:](v8, "prepareForPerformingRequests:error:", v10, &v19) & 1) != 0)v17 = 0;
      else
        v17 = -31710;
    }
    else
    {
      v17 = -31702;
    }
  }
  if (*v5 == 1)
    kdebug_trace();
  return v17;
}

- (id)bindIdealInputForRequest:(id)a3 fromAttachedMediaUsingKey:(id)a4
{
  void *v7;
  BWInferenceVideoFormatRequirements *v8;
  _BOOL8 v9;
  BWInferenceVideoRequirement *v10;
  BWInferenceVideoFormatRequirements *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "supportedImageSizeSet"), "firstObject");
  v8 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", objc_msgSend((id)objc_msgSend(v7, "pixelsWideRange"), "idealDimension"));
  -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", objc_msgSend((id)objc_msgSend(v7, "pixelsHighRange"), "idealDimension"));
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "idealImageFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1));
  v9 = (objc_msgSend(v7, "isOrientationAgnostic") & 1) == 0 && objc_msgSend(v7, "idealOrientation") == 1;
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v8, "setDeviceOriented:", v9);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v8, "setSupportedColorSpaceProperties:", &unk_1E4A01B68);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v8, "setBytesPerRowAlignment:", 64);
  v12 = v8;
  v10 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", a4, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1)));
  -[NSMutableArray addObject:](self->_inputVideoRequirements, "addObject:", v10);
  if (!-[BWVisionInferenceProvider primaryInputVideoRequirement](self, "primaryInputVideoRequirement")
    && -[NSString isEqualToString:](-[BWInferenceMediaRequirement attachedMediaKey](v10, "attachedMediaKey"), "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWVisionInferenceProvider setPrimaryInputVideoRequirement:](self, "setPrimaryInputVideoRequirement:", v10);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v10);
  return v10;
}

- (id)bindInputForRequest:(id)a3 fromMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a4);
  -[NSMutableArray addObject:](self->_inputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v6);
  return v6;
}

- (id)bindOutputForRequest:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  BWInferenceVideoRequirement *v7;

  v7 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", a4, a5);
  -[NSMutableArray addObject:](self->_outputVideoRequirements, "addObject:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v7);
  return v7;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  BWInferenceCloneVideoRequirement *v5;

  v5 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", a4, a3);
  -[NSMutableArray addObject:](self->_cloneVideoRequirements, "addObject:", v5);
  return v5;
}

- (id)bindOutputForRequest:(id)a3 asMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a4);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v6);
  return v6;
}

- (id)bindOutputForRequest:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:mappingOption:", a4, 2);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestIndexByRequirement, "setObject:forKeyedSubscript:", -[NSMapTable objectForKey:](self->_requestIndexByRequest, "objectForKey:", a3), v6);
  return v6;
}

- (int)type
{
  return self->_type;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (NSSet)preventionReasons
{
  return self->_preventionReasons;
}

- (NSArray)inputMetadataRequirements
{
  return &self->_inputMetadataRequirements->super;
}

- (NSArray)outputMetadataRequirements
{
  return &self->_outputMetadataRequirements->super;
}

@end
