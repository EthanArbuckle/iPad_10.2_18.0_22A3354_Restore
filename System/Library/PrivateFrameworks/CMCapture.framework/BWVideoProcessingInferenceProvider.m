@implementation BWVideoProcessingInferenceProvider

- (id)newStorage
{
  return -[BWVideoProcessingInferenceStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:]([BWVideoProcessingInferenceStorage alloc], "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", self->_inputVideoRequirements, self->_outputVideoRequirements);
}

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
  return +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:](BWInferenceEngine, "allowedBufferCompressionDirectionForExecutionTarget:", self->_executionTarget);
}

- (id)bindVideoInputFromAttachedMediaUsingKey:(id)a3 preparedByAttachedMediaKey:(id)a4 withVideoFormatProvider:(id)a5
{
  BWInferenceLazyVideoRequirement *v6;

  v6 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", a3, a3, a5);
  -[NSMutableArray addObject:](self->_inputVideoRequirements, "addObject:", v6);
  return v6;
}

- (BWVideoProcessingInferenceProvider)initWithType:(int)a3 analysisType:(unint64_t)a4 executionTarget:(int)a5 schedulerPriority:(unsigned int)a6 preventionReasons:(id)a7 resourceProvider:(id)a8
{
  BWVideoProcessingInferenceProvider *v12;
  BWVideoProcessingInferenceProvider *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWVideoProcessingInferenceProvider;
  v12 = -[BWVideoProcessingInferenceProvider init](&v15, sel_init, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8);
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_executionTarget = a5;
    v12->_preventionReasons = (NSSet *)objc_msgSend(a7, "copy");
    v13->_analysisType = a4;
    v13->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v13;
}

- (id)bindOutputMetadataKeys:(id)a3
{
  BWInferenceMetadataRequirement *v4;

  v4 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a3);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v4);
  return v4;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  _DWORD *v5;
  void *VCPCaptureAnalysisSessionClass;
  unint64_t analysisType;
  uint64_t v8;
  __int128 v9;
  VCPCaptureAnalysisSession *v10;
  void *v11;
  VCPCaptureAnalysisSession *vcpSession;
  uint64_t v13;
  int v14;
  _OWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  VCPCaptureAnalysisSessionClass = (void *)getVCPCaptureAnalysisSessionClass();
  analysisType = self->_analysisType;
  v19[0] = getVCPCaptureAnalysisDispatchQueuePropertyKey();
  v19[1] = CFSTR("turboMode");
  v20[0] = a3;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v9;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v10 = (VCPCaptureAnalysisSession *)(id)objc_msgSend(VCPCaptureAnalysisSessionClass, "analyzerForAnalysisTypes:withPreferredTransform:properties:", analysisType, v16, v8);
  self->_vcpSession = v10;
  if (!v10
    || (v11 = (void *)-[NSMutableArray firstObject](self->_inputVideoRequirements, "firstObject"),
        vcpSession = self->_vcpSession,
        v17[0] = CFSTR("frameWidth"),
        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "width")), v17[1] = CFSTR("frameHeight"), v18[0] = v13, v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "height")), -[VCPCaptureAnalysisSession prewarmWithProperties:](vcpSession, "prewarmWithProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2))))
  {
    v14 = -31702;
  }
  else
  {
    v14 = 0;
  }
  if (*v5 == 1)
    kdebug_trace();
  return v14;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[VCPCaptureAnalysisSession finalizeAnalysis](self->_vcpSession, "finalizeAnalysis");
  v3.receiver = self;
  v3.super_class = (Class)BWVideoProcessingInferenceProvider;
  -[BWVideoProcessingInferenceProvider dealloc](&v3, sel_dealloc);
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (int)prepareForExecution
{
  _DWORD *v3;
  void *VCPCaptureAnalysisSessionClass;
  unint64_t analysisType;
  __int128 v6;
  _OWORD v8[3];

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  VCPCaptureAnalysisSessionClass = (void *)getVCPCaptureAnalysisSessionClass();
  analysisType = self->_analysisType;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  self->_vcpSession = (VCPCaptureAnalysisSession *)(id)objc_msgSend(VCPCaptureAnalysisSessionClass, "analyzerForAnalysisTypes:withPreferredTransform:properties:", analysisType, v8, 0);
  if (*v3 == 1)
    kdebug_trace();
  return 0;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  VCPCaptureAnalysisSession *vcpSession;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *outputMetadataRequirements;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v11 = objc_msgSend(a4, "pixelBufferForRequirement:", -[NSMutableArray firstObject](self->_inputVideoRequirements, "firstObject"));
  if (v11)
  {
    v12 = v11;
    memset(&v30, 0, sizeof(v30));
    CMSampleBufferGetPresentationTimeStamp(&v30, a3);
    memset(&v29, 0, sizeof(v29));
    CMSampleBufferGetDuration(&v29, a3);
    vcpSession = self->_vcpSession;
    v28 = v30;
    v27 = v29;
    v14 = -[VCPCaptureAnalysisSession analyzePixelBuffer:withTimestamp:andDuration:properties:error:](vcpSession, "analyzePixelBuffer:withTimestamp:andDuration:properties:error:", v12, &v28, &v27, 0, 0);
    if (v14)
    {
      v15 = v14;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      outputMetadataRequirements = self->_outputMetadataRequirements;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(outputMetadataRequirements);
            objc_msgSend(a4, "setDictionary:forMetadataRequirement:", v15, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          }
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v18);
      }
      v21 = 0;
    }
    else
    {
      v21 = 4294935577;
    }
  }
  else
  {
    v21 = 4294935584;
  }
  if (*v10 == 1)
    kdebug_trace();
  (*((void (**)(id, uint64_t, BWVideoProcessingInferenceProvider *))a6 + 2))(a6, v21, self);
  return v21;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  _DWORD *v11;
  uint64_t v12;
  VCPCaptureAnalysisSession *vcpSession;
  int v14;
  CMTime v16;
  CMTime v17;
  _QWORD v18[8];
  CMTime v19;
  CMTime v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v12 = objc_msgSend(a4, "pixelBufferForRequirement:", -[NSMutableArray firstObject](self->_inputVideoRequirements, "firstObject"));
  if (v12)
  {
    memset(&v20, 0, sizeof(v20));
    CMSampleBufferGetPresentationTimeStamp(&v20, a3);
    memset(&v19, 0, sizeof(v19));
    CMSampleBufferGetDuration(&v19, a3);
    vcpSession = self->_vcpSession;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __120__BWVideoProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
    v18[3] = &unk_1E49240D0;
    v18[4] = a4;
    v18[5] = self;
    v18[6] = a7;
    v18[7] = &v21;
    v17 = v20;
    v16 = v19;
    -[VCPCaptureAnalysisSession analyzePixelBuffer:withTimestamp:andDuration:properties:completion:](vcpSession, "analyzePixelBuffer:withTimestamp:andDuration:properties:completion:", v12, &v17, &v16, 0, v18);
  }
  else
  {
    *((_DWORD *)v22 + 6) = -31712;
    (*((void (**)(id, uint64_t, BWVideoProcessingInferenceProvider *))a7 + 2))(a7, 4294935584, self);
    if (*v11 == 1)
      kdebug_trace();
  }
  v14 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __120__BWVideoProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = -31719;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)a1[4];
    v7 = *(void **)(a1[5] + 56);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "setDictionary:forMetadataRequirement:", a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
  }
  result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  _DWORD *v9;
  NSMutableArray *outputMetadataRequirements;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  outputMetadataRequirements = self->_outputMetadataRequirements;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(outputMetadataRequirements);
        v15 = (void *)objc_msgSend(a4, "newMetadataDictionarySatisfyingRequirement:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14));
        objc_msgSend(a3, "addEntriesFromDictionary:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputMetadataRequirements, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }
  if (*v9 == 1)
    kdebug_trace();
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
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
