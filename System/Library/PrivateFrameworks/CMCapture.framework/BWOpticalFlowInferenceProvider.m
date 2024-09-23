@implementation BWOpticalFlowInferenceProvider

- (id)newStorage
{
  void *v3;
  unint64_t concurrencyWidth;
  BWInferenceProviderStorage *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_outputRequirement);
  concurrencyWidth = self->_concurrencyWidth;
  if (concurrencyWidth >= 2)
  {
    do
    {
      objc_msgSend(v3, "addObject:", self->_outputRequirement);
      --concurrencyWidth;
    }
    while (concurrencyWidth > 1);
  }
  v5 = [BWInferenceProviderStorage alloc];
  v7[0] = self->_inputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v5, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1), v3);
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (int)type
{
  return 115;
}

- (NSArray)outputVideoRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_outputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)inputVideoRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_inputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (BWOpticalFlowInferenceProvider)initWithInputRequirement:(id)a3 outputRequirement:(id)a4 portType:(id)a5 resourceProvider:(id)a6 configuration:(id)a7
{
  BWOpticalFlowInferenceProvider *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWOpticalFlowInferenceProvider;
  v12 = -[BWOpticalFlowInferenceProvider init](&v14, sel_init);
  if (v12)
  {
    v12->_metalInferenceContext = (BWMetalInferenceContext *)(id)objc_msgSend(a6, "defaultDeviceMetalContext");
    v12->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v12->_outputRequirement = (BWInferenceVideoRequirement *)a4;
    v12->_portType = (NSString *)a5;
    v12->_concurrencyWidth = objc_msgSend(a7, "concurrencyWidth");
    v12->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v12;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  PTDisparityPostProcessing *disparityPostProcessor;
  BWInferenceVideoFormat *v5;
  BWInferenceVideoFormat *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MTLCommandQueue *v12;
  NSString *portType;
  PTDisparityPostProcessing *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  disparityPostProcessor = self->_disparityPostProcessor;
  if (disparityPostProcessor)

  v5 = -[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat", a3);
  v6 = -[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat");
  v7 = -[BWInferenceVideoFormat width](v5, "width");
  v8 = -[BWInferenceVideoFormat height](v5, "height");
  v9 = -[BWInferenceVideoFormat width](v6, "width");
  v10 = -[BWInferenceVideoFormat height](v6, "height");
  v11 = objc_alloc((Class)getPTDisparityPostProcessingClass());
  v12 = -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue");
  portType = self->_portType;
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = 1;
  v17[0] = v9;
  v17[1] = v10;
  v17[2] = 1;
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = 1;
  v14 = (PTDisparityPostProcessing *)objc_msgSend(v11, "initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v12, v18, v17, 25, v16, 71, portType);
  self->_disparityPostProcessor = v14;
  if (v14)
  {
    self->_colorInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "height"), 0);
    self->_colorOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat"), "height"), 0);
    -[MTLTextureDescriptor setUsage:](self->_colorInputDescriptor, "setUsage:", 1);
    -[MTLTextureDescriptor setUsage:](self->_colorOutputDescriptor, "setUsage:", 2);
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -31702;
  }
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  BWInferenceCloneVideoRequirement *v5;

  v5 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", a4, a3);
  -[NSMutableArray addObject:](self->_cloneVideoRequirements, "addObject:", v5);
  return v5;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWOpticalFlowInferenceProvider;
  -[BWOpticalFlowInferenceProvider dealloc](&v3, sel_dealloc);
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  _DWORD *v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[6];
  int v19;

  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v11 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputRequirement);
  if (v11)
  {
    v12 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_outputRequirement), "newPixelBuffer");
    if (v12)
    {
      objc_msgSend(a4, "setPixelBuffer:forRequirement:", v12, self->_outputRequirement);
      v13 = (void *)objc_msgSend((id)-[MTLCommandQueue device](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "device"), "newTextureWithDescriptor:iosurface:plane:", self->_colorOutputDescriptor, CVPixelBufferGetIOSurface(v12), 0);
      v11 = (__CVBuffer *)objc_msgSend((id)-[MTLCommandQueue device](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "device"), "newTextureWithDescriptor:iosurface:plane:", self->_colorInputDescriptor, CVPixelBufferGetIOSurface(v11), 0);
      if (-[PTDisparityPostProcessing computeOpticalFlow:outDisplacement:](self->_disparityPostProcessor, "computeOpticalFlow:outDisplacement:", v11, v13))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v16 = 4294935586;
      }
      else
      {
        v14 = (void *)-[MTLCommandQueue commandBuffer](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "commandBuffer");
        if (v14)
        {
          v15 = v14;
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __116__BWOpticalFlowInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
          v18[3] = &unk_1E491EA20;
          v19 = 0;
          v18[4] = self;
          v18[5] = a7;
          objc_msgSend(v14, "addScheduledHandler:", v18);
          objc_msgSend(v15, "addCompletedHandler:", &__block_literal_global_4);
          objc_msgSend(v15, "commit");
          LODWORD(v16) = 0;
LABEL_8:
          CFRelease(v12);
          goto LABEL_9;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
        v16 = 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v11 = 0;
      v13 = 0;
      v16 = 4294935578;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
    v13 = 0;
    v16 = 4294935584;
  }
  if (a7)
    (*((void (**)(id, uint64_t, BWOpticalFlowInferenceProvider *))a7 + 2))(a7, v16, self);
  if (*v10 == 1)
    kdebug_trace();
  if (v12)
    goto LABEL_8;
LABEL_9:

  return v16;
}

uint64_t __116__BWOpticalFlowInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __116__BWOpticalFlowInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  const void *v9;
  NSMutableArray *cloneVideoRequirements;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", self->_outputRequirement, a6, a5);
  BWSampleBufferSetAttachedMedia(a6, (uint64_t)-[BWInferenceMediaRequirement attachedMediaKey](self->_outputRequirement, "attachedMediaKey"), (uint64_t)v9);
  if (v9)
    CFRelease(v9);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(cloneVideoRequirements);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v16 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingCloneRequirement:", v15);
        BWSampleBufferSetAttachedMedia(a6, objc_msgSend(v15, "attachedMediaKey"), (uint64_t)v16);
        if (v16)
          CFRelease(v16);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
}

@end
