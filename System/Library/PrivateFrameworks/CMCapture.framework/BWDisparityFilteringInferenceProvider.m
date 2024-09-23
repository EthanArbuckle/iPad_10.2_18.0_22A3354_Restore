@implementation BWDisparityFilteringInferenceProvider

- (id)newStorage
{
  uint64_t v3;
  void *v4;
  unint64_t concurrencyWidth;
  BWInferenceProviderStorage *v6;
  BWInferenceVideoRequirement *disparityInputRequirement;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = self->_outputRequirement;
  v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  if (self->_concurrencyWidth < 2)
  {
    v4 = (void *)v3;
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_outputRequirement);
    concurrencyWidth = self->_concurrencyWidth;
    if (concurrencyWidth >= 2)
    {
      do
      {
        objc_msgSend(v4, "addObject:", self->_outputRequirement);
        --concurrencyWidth;
      }
      while (concurrencyWidth > 1);
    }
  }
  v6 = [BWInferenceProviderStorage alloc];
  disparityInputRequirement = self->_disparityInputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v6, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &disparityInputRequirement, 1), v4);
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (int)type
{
  return 110;
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
  v3[0] = self->_disparityInputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  int RequestedRotationDegrees;
  int64_t v5;
  ADPCEDisparityColorPipeline *stereoPipeline;
  ADPCEDisparityColorPipeline *v7;
  BWInferenceVideoFormat *v8;
  BWInferenceVideoFormat *v9;
  uint64_t v10;

  RequestedRotationDegrees = bwisr_getRequestedRotationDegrees(-[BWInferenceVideoRequirement videoFormat](self->_disparityInputRequirement, "videoFormat", a3), -[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat"));
  if (self->_requiresVerticalFlipOfDepthBuffer)
    RequestedRotationDegrees = (RequestedRotationDegrees + 180) % 360;
  if (RequestedRotationDegrees == 90)
  {
    v5 = 3;
  }
  else if (RequestedRotationDegrees == 180)
  {
    v5 = 2;
  }
  else
  {
    v5 = RequestedRotationDegrees == 270;
  }
  self->_requestedRotation = v5;
  stereoPipeline = self->_stereoPipeline;
  if (stereoPipeline)

  v7 = (ADPCEDisparityColorPipeline *)objc_msgSend(objc_alloc((Class)getADPCEDisparityColorPipelineClass()), "initForInputSource:metalDevice:", self->_inputSource, -[MTLCommandQueue device](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "device"));
  self->_stereoPipeline = v7;
  if (!v7)
    return FigSignalErrorAt();
  v8 = -[BWInferenceVideoRequirement videoFormat](self->_disparityInputRequirement, "videoFormat");
  v9 = -[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat");
  if (self->_isPreProcessing)
    v10 = 23;
  else
    v10 = 25;
  self->_disparityInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v10, -[BWInferenceVideoFormat width](v8, "width"), -[BWInferenceVideoFormat height](v8, "height"), 0);
  self->_disparityOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v9, "width"), -[BWInferenceVideoFormat height](v9, "height"), 0);
  if (self->_requiresCroppingOfDepthBuffer)
    self->_disparitySourceTextureCroppedUpscaledAndMirrored = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](-[BWMetalInferenceContext device](self->_metalInferenceContext, "device"), "newTextureWithDescriptor:", self->_disparityInputDescriptor);
  return 0;
}

- (BWDisparityFilteringInferenceProvider)initWithDisparityInputRequirement:(id)a3 disparityOutputRequirement:(id)a4 resourceProvider:(id)a5 configuration:(id)a6 isPreprocessing:(BOOL)a7
{
  BWDisparityFilteringInferenceProvider *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BWDisparityFilteringInferenceProvider;
  v12 = -[BWDisparityFilteringInferenceProvider init](&v19, sel_init);
  if (v12)
  {
    v12->_metalInferenceContext = (BWMetalInferenceContext *)(id)objc_msgSend(a5, "defaultDeviceMetalContext");
    v18 = 0;
    v13 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](-[BWMetalInferenceContext device](v12->_metalInferenceContext, "device"), "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), &v18);
    if (v13
      && (v14 = v13,
          v15 = (void *)objc_msgSend(v13, "newFunctionWithName:", CFSTR("depthCropUpscaleAndMirror")),
          v14,
          v12->_cropPipelineState = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](-[BWMetalInferenceContext device](v12->_metalInferenceContext, "device"), "newComputePipelineStateWithFunction:error:", v15, &v18), v15, v12->_cropPipelineState))
    {
      v12->_disparityInputRequirement = (BWInferenceVideoRequirement *)a3;
      v12->_outputRequirement = (BWInferenceVideoRequirement *)a4;
      v12->_concurrencyWidth = objc_msgSend(a6, "concurrencyWidth");
      v12->_requiresCroppingOfDepthBuffer = objc_msgSend(a6, "requiresCroppingOfDepthBuffer");
      v12->_requiresVerticalFlipOfDepthBuffer = objc_msgSend(a6, "requiresVerticalFlipOfDepthBuffer");
      v12->_inputSource = 0;
      v16 = objc_msgSend(a6, "videoDepthAlgorithm");
      if (v16 < 4)
      {
        v12->_inputSource = qword_1A32B0FD0[v16];
        v12->_isPreProcessing = a7;
        return v12;
      }

    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return 0;
  }
  return v12;
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

  if (self->_requiresCroppingOfDepthBuffer)
  v4.receiver = self;
  v4.super_class = (Class)BWDisparityFilteringInferenceProvider;
  -[BWDisparityFilteringInferenceProvider dealloc](&v4, sel_dealloc);
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  int v11;
  _DWORD *v12;
  uint64_t v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  MTLCommandQueue *v16;
  MTLTexture *v17;
  void *v18;
  void *v19;
  unsigned __int16 v20;
  const void *AttachedMedia;
  void *v22;
  int v23;
  int v24;
  double v25;
  double v26;
  int v27;
  CGSize v28;
  void *v29;
  void *v30;
  uint64_t v31;
  float32x4_t v32;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  MTLTexture *disparitySourceTextureCroppedUpscaledAndMirrored;
  uint64_t v44;
  uint64_t v45;
  unsigned __int16 v47;
  int v48;
  _QWORD v49[4];
  int v50;
  _QWORD v51[6];
  int v52;
  _QWORD v53[3];
  _QWORD v54[3];
  BOOL requiresVerticalFlipOfDepthBuffer;
  float32x4_t v56;
  CGRect rect;

  if (self->_isPreProcessing)
    v11 = 11;
  else
    v11 = 14;
  v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v13 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_disparityInputRequirement);
  if (v13)
  {
    v14 = (__CVBuffer *)v13;
    v15 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_outputRequirement), "newPixelBuffer");
    if (v15)
    {
      v48 = v11;
      objc_msgSend(a4, "setPixelBuffer:forRequirement:", v15, self->_outputRequirement);
      v16 = -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue");
      v17 = (MTLTexture *)objc_msgSend((id)-[MTLCommandQueue device](v16, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_disparityInputDescriptor, CVPixelBufferGetIOSurface(v14), 0);
      v18 = (void *)objc_msgSend((id)-[MTLCommandQueue device](v16, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_disparityOutputDescriptor, CVPixelBufferGetIOSurface(v15), 0);
      v19 = (void *)-[MTLCommandQueue commandBuffer](v16, "commandBuffer");
      objc_msgSend(a4, "setPixelBuffer:forRequirement:", v15, self->_outputRequirement);
      if (self->_isPreProcessing)
      {
        v20 = objc_msgSend((id)objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FC8]), "shortValue");
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)-[BWInferenceMediaRequirement attachedMediaKey](self->_disparityInputRequirement, "attachedMediaKey"));
        v22 = (void *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
        objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D063A8]), "floatValue");
        v24 = v23;
        objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D063B0]), "floatValue");
        v27 = LODWORD(v25);
        if (self->_requiresCroppingOfDepthBuffer)
        {
          v28 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          rect.size = v28;
          v29 = (void *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          v47 = v20;
          if (v29
            && (v30 = v29,
                v31 = *MEMORY[0x1E0D05E68],
                objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68])))
          {
            CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v30, "objectForKeyedSubscript:", v31), &rect);
            v32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)rect.origin), (float64x2_t)rect.size);
          }
          else
          {
            rect.origin.x = 0.0;
            rect.origin.y = 0.0;
            __asm { FMOV            V0.2D, #1.0 }
            rect.size = _Q0;
            v32 = (float32x4_t)xmmword_1A32B0FC0;
          }
          v56 = v32;
          requiresVerticalFlipOfDepthBuffer = self->_requiresVerticalFlipOfDepthBuffer;
          v38 = (void *)objc_msgSend(v19, "computeCommandEncoder");
          objc_msgSend(v38, "setTexture:atIndex:", v17, 0);
          objc_msgSend(v38, "setTexture:atIndex:", self->_disparitySourceTextureCroppedUpscaledAndMirrored, 1);
          objc_msgSend(v38, "setBytes:length:atIndex:", &v56, 16, 0);
          objc_msgSend(v38, "setBytes:length:atIndex:", &requiresVerticalFlipOfDepthBuffer, 1, 1);
          objc_msgSend(v38, "setComputePipelineState:", self->_cropPipelineState);
          v39 = -[MTLComputePipelineState threadExecutionWidth](self->_cropPipelineState, "threadExecutionWidth");
          v40 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_cropPipelineState, "maxTotalThreadsPerThreadgroup")/ v39;
          v41 = -[MTLTexture width](self->_disparitySourceTextureCroppedUpscaledAndMirrored, "width");
          v42 = -[MTLTexture height](self->_disparitySourceTextureCroppedUpscaledAndMirrored, "height");
          v54[0] = v41;
          v54[1] = v42;
          v54[2] = 1;
          v53[0] = v39;
          v53[1] = v40;
          v53[2] = 1;
          objc_msgSend(v38, "dispatchThreads:threadsPerThreadgroup:", v54, v53);
          objc_msgSend(v38, "endEncoding");
          disparitySourceTextureCroppedUpscaledAndMirrored = self->_disparitySourceTextureCroppedUpscaledAndMirrored;
          v20 = v47;
        }
        else
        {
          self->_disparitySourceTextureCroppedUpscaledAndMirrored = v17;
          disparitySourceTextureCroppedUpscaledAndMirrored = v17;
        }
        LODWORD(v25) = v24;
        LODWORD(v26) = v27;
        if (!-[ADPCEDisparityColorPipeline encodeDisparityPreprocessingToCommandBuffer:input:normalizationMultiplier:normalizationOffset:invalidValue:rotation:output:](self->_stereoPipeline, "encodeDisparityPreprocessingToCommandBuffer:input:normalizationMultiplier:normalizationOffset:invalidValue:rotation:output:", v19, disparitySourceTextureCroppedUpscaledAndMirrored, v20, self->_requestedRotation, v18, v25, v26))goto LABEL_19;
        fig_log_get_emitter();
      }
      else
      {
        if (!-[ADPCEDisparityColorPipeline encodeDisparityPostprocessingToCommandBuffer:input:output:](self->_stereoPipeline, "encodeDisparityPostprocessingToCommandBuffer:input:output:", v19, v17, v18))
        {
LABEL_19:
          v44 = MEMORY[0x1E0C809B0];
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
          v51[3] = &unk_1E491EA20;
          v52 = 0;
          v51[4] = self;
          v51[5] = a7;
          objc_msgSend(v19, "addScheduledHandler:", v51);
          v49[0] = v44;
          v49[1] = 3221225472;
          v49[2] = __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2;
          v49[3] = &__block_descriptor_36_e28_v16__0___MTLCommandBuffer__8l;
          v50 = v48;
          objc_msgSend(v19, "addCompletedHandler:", v49);
          objc_msgSend(v19, "commit");
          LODWORD(v45) = 0;
LABEL_20:
          CFRelease(v15);
          goto LABEL_21;
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
      v45 = 4294935586;
      v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v18 = 0;
      v17 = 0;
      v45 = 4294935578;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
    v17 = 0;
    v15 = 0;
    v45 = 4294935584;
  }
  if (a7)
  {
    if (*v12 == 1)
      kdebug_trace();
    (*((void (**)(id, uint64_t, BWDisparityFilteringInferenceProvider *))a7 + 2))(a7, v45, self);
  }
  if (v15)
    goto LABEL_20;
LABEL_21:

  return v45;
}

uint64_t __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2()
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
  return 0;
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
  __CVBuffer *v8;
  NSString *v9;
  __int128 v10;
  uint64_t v11;
  CFTypeRef cf;

  cf = 0;
  v8 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_outputRequirement);
  if (v8)
  {
    v10 = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    if (!BWSampleBufferCreateFromPixelBuffer(v8, (uint64_t)&v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&cf))
    {
      v9 = -[BWInferenceMediaRequirement attachedMediaKey](self->_outputRequirement, "attachedMediaKey");
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

@end
