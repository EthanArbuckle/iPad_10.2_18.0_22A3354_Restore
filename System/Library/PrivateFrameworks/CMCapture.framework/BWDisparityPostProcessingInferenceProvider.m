@implementation BWDisparityPostProcessingInferenceProvider

- (id)newStorage
{
  id v3;
  BWInferenceVideoRequirement *stateOutputRequirement;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t concurrencyWidth;
  uint64_t v11;
  BWInferenceProviderStorage *v12;
  __int128 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  stateOutputRequirement = self->_stateOutputRequirement;
  v20[0] = self->_disparityOutputRequirement;
  v20[1] = stateOutputRequirement;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        concurrencyWidth = self->_concurrencyWidth;
        if (concurrencyWidth)
        {
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          do
          {
            objc_msgSend(v3, "addObject:", v11);
            --concurrencyWidth;
          }
          while (concurrencyWidth);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }
  v12 = [BWInferenceProviderStorage alloc];
  v13 = *(_OWORD *)&self->_stateInputRequirement;
  v19[0] = *(_OWORD *)&self->_displacementInputRequirement;
  v19[1] = v13;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v12, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4), v3);
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
  v3[0] = self->_disparityOutputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)inputVideoRequirements
{
  __int128 v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)&self->_stateInputRequirement;
  v4[0] = *(_OWORD *)&self->_displacementInputRequirement;
  v4[1] = v2;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (BWDisparityPostProcessingInferenceProvider)initWithDisparityInputRequirement:(id)a3 displacementInputRequirement:(id)a4 stateInputRequirement:(id)a5 stateOutputRequirement:(id)a6 disparityOutputRequirement:(id)a7 portType:(id)a8 resourceProvider:(id)a9 configuration:(id)a10
{
  BWDisparityPostProcessingInferenceProvider *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BWDisparityPostProcessingInferenceProvider;
  v16 = -[BWDisparityPostProcessingInferenceProvider init](&v18, sel_init);
  if (v16)
  {
    v16->_metalInferenceContext = (BWMetalInferenceContext *)(id)objc_msgSend(a9, "defaultDeviceMetalContext");
    v16->_disparityInputRequirement = (BWInferenceVideoRequirement *)a3;
    v16->_displacementInputRequirement = (BWInferenceVideoRequirement *)a4;
    v16->_disparityOutputRequirement = (BWInferenceVideoRequirement *)a7;
    v16->_stateInputRequirement = (BWInferenceVideoRequirement *)a5;
    v16->_stateOutputRequirement = (BWInferenceVideoRequirement *)a6;
    v16->_portType = (NSString *)a8;
    v16->_concurrencyWidth = objc_msgSend(a10, "concurrencyWidth");
  }
  return v16;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  BWInferenceVideoFormat *v4;
  uint64_t v5;
  uint64_t v6;
  BWInferenceVideoFormat *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  MTLCommandQueue *v11;
  NSString *portType;
  PTDisparityPostProcessing *v13;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];

  self->_disparityPostProcessor = 0;
  v4 = -[BWInferenceVideoRequirement videoFormat](self->_disparityInputRequirement, "videoFormat");
  v5 = -[BWInferenceVideoFormat width](v4, "width");
  v6 = -[BWInferenceVideoFormat height](v4, "height");
  v7 = -[BWInferenceVideoRequirement videoFormat](self->_disparityOutputRequirement, "videoFormat");
  v8 = -[BWInferenceVideoFormat width](v7, "width");
  v9 = -[BWInferenceVideoFormat height](v7, "height");
  v10 = objc_alloc((Class)getPTDisparityPostProcessingClass());
  v11 = -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue");
  portType = self->_portType;
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = 1;
  v16[0] = v8;
  v16[1] = v9;
  v16[2] = 1;
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = 1;
  v13 = (PTDisparityPostProcessing *)objc_msgSend(v10, "initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v11, v17, v16, 25, v15, 71, portType);
  self->_disparityPostProcessor = v13;
  if (v13)
  {
    self->_disparityInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), 0);
    self->_disparityOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v7, "width"), -[BWInferenceVideoFormat height](v7, "height"), 0);
    self->_displacementDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_displacementInputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_displacementInputRequirement, "videoFormat"), "height"), 0);
    self->_stateInDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](v7, "width"), -[BWInferenceVideoFormat height](v7, "height"), 0);
    self->_stateOutDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](v7, "width"), -[BWInferenceVideoFormat height](v7, "height"), 0);
    -[MTLTextureDescriptor setUsage:](self->_disparityInputDescriptor, "setUsage:", 1);
    -[MTLTextureDescriptor setUsage:](self->_disparityOutputDescriptor, "setUsage:", 2);
    -[MTLTextureDescriptor setUsage:](self->_displacementDescriptor, "setUsage:", 1);
    -[MTLTextureDescriptor setUsage:](self->_stateInDescriptor, "setUsage:", 1);
    -[MTLTextureDescriptor setUsage:](self->_stateOutDescriptor, "setUsage:", 2);
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -31702;
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWDisparityPostProcessingInferenceProvider;
  -[BWDisparityPostProcessingInferenceProvider dealloc](&v4, sel_dealloc);
}

- (uint64_t)newTextureWithRequirement:(void *)a3 usingStorage:(uint64_t)a4 descriptor:(int)a5 isOutput:
{
  uint64_t v10;
  __CVBuffer *v11;
  uint64_t v12;

  if (!a1)
    return 0;
  if (a5)
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "pixelBufferPoolForRequirement:", a2), "newPixelBuffer");
    if (v10)
    {
      v11 = (__CVBuffer *)v10;
      objc_msgSend(a3, "setPixelBuffer:forRequirement:", v10, a2);
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  v11 = (__CVBuffer *)objc_msgSend(a3, "pixelBufferForRequirement:", a2);
  if (!v11)
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
LABEL_6:
  v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "commandQueue"), "device"), "newTextureWithDescriptor:iosurface:plane:", a4, CVPixelBufferGetIOSurface(v11), 0);
  if (a5)
    CFRelease(v11);
  return v12;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  _DWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[6];
  int v21;

  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v11 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_disparityInputRequirement, a4, (uint64_t)self->_disparityInputDescriptor, 0);
  if (!v11)
  {
    v15 = 0;
    v12 = 0;
LABEL_14:
    v14 = 0;
    v13 = 0;
    goto LABEL_17;
  }
  v12 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_disparityOutputRequirement, a4, (uint64_t)self->_disparityOutputDescriptor, 1);
  if (!v12)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v13 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_stateInputRequirement, a4, (uint64_t)self->_stateInDescriptor, 0);
  if (!v13)
  {
    v15 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  v14 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_stateOutputRequirement, a4, (uint64_t)self->_stateOutDescriptor, 0);
  if (!v14)
  {
    v15 = 0;
    goto LABEL_17;
  }
  v15 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_displacementInputRequirement, a4, (uint64_t)self->_displacementDescriptor, 0);
  if (!v15)
  {
LABEL_17:
    v18 = 4294935578;
    goto LABEL_18;
  }
  if (-[PTDisparityPostProcessing temporalDisparityFilter:inStatePrev:inDisparity:outDisparityFiltered:outState:](self->_disparityPostProcessor, "temporalDisparityFilter:inStatePrev:inDisparity:outDisparityFiltered:outState:", v15, v13, v11, v12, v14))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 4294935586;
  }
  else
  {
    v16 = (void *)-[MTLCommandQueue commandBuffer](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "commandBuffer");
    if (v16)
    {
      v17 = v16;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __128__BWDisparityPostProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
      v20[3] = &unk_1E491EA20;
      v21 = 0;
      v20[4] = self;
      v20[5] = a7;
      objc_msgSend(v16, "addScheduledHandler:", v20);
      objc_msgSend(v17, "addCompletedHandler:", &__block_literal_global_70);
      objc_msgSend(v17, "commit");
      LODWORD(v18) = 0;
      goto LABEL_11;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }
LABEL_18:
  if (a7)
    (*((void (**)(id, uint64_t, BWDisparityPostProcessingInferenceProvider *))a7 + 2))(a7, v18, self);
  if (*v10 == 1)
    kdebug_trace();
LABEL_11:

  return v18;
}

uint64_t __128__BWDisparityPostProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __128__BWDisparityPostProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2()
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

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  __CVBuffer *v8;
  NSString *v9;
  __int128 v10;
  uint64_t v11;
  CFTypeRef cf;

  cf = 0;
  v8 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_disparityOutputRequirement);
  if (v8)
  {
    v10 = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    if (!BWSampleBufferCreateFromPixelBuffer(v8, (uint64_t)&v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&cf))
    {
      v9 = -[BWInferenceMediaRequirement attachedMediaKey](self->_disparityOutputRequirement, "attachedMediaKey");
      BWSampleBufferSetAttachedMedia(a6, (uint64_t)v9, (uint64_t)cf);
      goto LABEL_4;
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_4:
  if (cf)
    CFRelease(cf);
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

@end
