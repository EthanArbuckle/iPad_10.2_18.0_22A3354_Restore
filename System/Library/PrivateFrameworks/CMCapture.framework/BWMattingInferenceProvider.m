@implementation BWMattingInferenceProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWMattingInferenceProvider)initWithConfiguration:(id)a3
{
  BWMattingInferenceProvider *v4;
  float v5;
  int v6;
  int v7;
  BWInferenceLazyVideoRequirement *v8;
  uint64_t v9;
  uint64_t v10;
  BWInferenceVideoFormatRequirements *v11;
  BWInferenceLazyVideoRequirement *v12;
  NSArray *v13;
  NSArray *v14;
  BWInferenceLazyVideoRequirement *refinedDepthOutputVideoRequirement;
  void *v16;
  BWInferenceVideoRequirement **p_segmentationOutputVideoRequirement;
  uint64_t v18;
  NSArray *v19;
  NSArray *v20;
  _QWORD v22[4];
  int v23;
  _QWORD v24[4];
  int v25;
  _QWORD v26[4];
  int v27;
  objc_super v28;
  BWInferenceVideoRequirement *segmentationOutputVideoRequirement;
  _QWORD v30[2];
  __int128 v31;
  BWInferenceVideoRequirement *depthInputVideoRequirement;
  BWInferenceLazyVideoRequirement *v33;
  BWInferenceVideoFormatRequirements *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)BWMattingInferenceProvider;
  v4 = -[BWMattingInferenceProvider init](&v28, sel_init);
  if (v4)
  {
    if (a3 && (objc_msgSend(a3, "mainImageDownscalingFactor"), v5 != 0.0))
    {
      v4->_tuningParameters = (NSDictionary *)(id)objc_msgSend(a3, "tuningParameters");
      v4->_sdofRenderingTuningParameters = (NSDictionary *)(id)objc_msgSend(a3, "sdofRenderingTuningParameters");
      objc_msgSend(a3, "mainImageDownscalingFactor");
      v7 = v6;
      v8 = [BWInferenceLazyVideoRequirement alloc];
      v9 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke;
      v26[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      v27 = v7;
      v4->_primaryFormatInputVideoRequirement = (BWInferenceVideoRequirement *)-[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v8, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v26);
      if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
        v10 = 1278226536;
      else
        v10 = 1278226534;
      v11 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v11, "setWidth:", 512);
      -[BWVideoFormatRequirements setHeight:](v11, "setHeight:", 384);
      v35[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1));
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v11, "setDeviceOriented:", 0);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v11, "setBytesPerRowAlignment:", 64);
      v34 = v11;
      v4->_segmentationInputVideoRequirement = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E49511B8, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1)));
      v4->_depthInputVideoRequirement = (BWInferenceVideoRequirement *)-[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("Depth"), CFSTR("Depth"), &__block_literal_global_52);
      v12 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("Depth"), CFSTR("Depth"), &__block_literal_global_14);
      v4->_disparityInputVideoRequirement = &v12->super;
      v31 = *(_OWORD *)&v4->_primaryFormatInputVideoRequirement;
      depthInputVideoRequirement = v4->_depthInputVideoRequirement;
      v33 = v12;
      v13 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 4);
      v4->_inputVideoRequirements = v13;
      v14 = v13;
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_18;
      v24[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      v25 = v7;
      v4->_segmentationOutputVideoRequirement = (BWInferenceVideoRequirement *)-[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E495AF38, CFSTR("PrimaryFormat"), v24);
      if ((objc_msgSend(a3, "refinedDepthDeliveryEnabled") & 1) != 0)
      {
        v22[0] = v9;
        v22[1] = 3221225472;
        v22[2] = __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_22;
        v22[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
        v23 = v7;
        refinedDepthOutputVideoRequirement = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E495AF58, CFSTR("PrimaryFormat"), v22);
        v4->_refinedDepthOutputVideoRequirement = &refinedDepthOutputVideoRequirement->super;
      }
      else
      {
        refinedDepthOutputVideoRequirement = (BWInferenceLazyVideoRequirement *)v4->_refinedDepthOutputVideoRequirement;
      }
      if (refinedDepthOutputVideoRequirement)
      {
        v30[0] = v4->_segmentationOutputVideoRequirement;
        v30[1] = refinedDepthOutputVideoRequirement;
        v16 = (void *)MEMORY[0x1E0C99D20];
        p_segmentationOutputVideoRequirement = (BWInferenceVideoRequirement **)v30;
        v18 = 2;
      }
      else
      {
        segmentationOutputVideoRequirement = v4->_segmentationOutputVideoRequirement;
        v16 = (void *)MEMORY[0x1E0C99D20];
        p_segmentationOutputVideoRequirement = &segmentationOutputVideoRequirement;
        v18 = 1;
      }
      v19 = (NSArray *)objc_msgSend(v16, "arrayWithObjects:count:", p_segmentationOutputVideoRequirement, v18);
      v4->_outputVideoRequirements = v19;
      v20 = v19;
      v4->_metalCommandQueue = (MTLCommandQueue *)(id)objc_msgSend(a3, "metalCommandQueue");
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "width") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "height") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00938);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_9(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00950);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_13(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00968);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v3, "setDeviceOriented:", 0);
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_18(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "width") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "height") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00980);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v4, "setBytesPerRowAlignment:", 64);
  -[BWVideoFormatRequirements setWidthAlignment:](v4, "setWidthAlignment:", 16);
  -[BWVideoFormatRequirements setHeightAlignment:](v4, "setHeightAlignment:", 16);
  -[BWVideoFormatRequirements setPlaneAlignment:](v4, "setPlaneAlignment:", 64);
  -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v4, "setMemoryPoolUseAllowed:", 0);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_22(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "width") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)objc_msgSend(a2, "height") / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00998);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v4, "setDeviceOriented:", 0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v4, "setBytesPerRowAlignment:", 64);
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

- (void)dealloc
{
  objc_super v3;

  -[FigMatting finishProcessing](self->_mattingProcessor, "finishProcessing");

  v3.receiver = self;
  v3.super_class = (Class)BWMattingInferenceProvider;
  -[BWMattingInferenceProvider dealloc](&v3, sel_dealloc);
}

- (int)type
{
  return 201;
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
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
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:]([BWMattingInferenceStorage alloc], "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v3, v4);
}

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:](BWInferenceEngine, "allowedBufferCompressionDirectionForExecutionTarget:", -[BWMattingInferenceProvider executionTarget](self, "executionTarget"));
}

- (int)prepareForExecution
{
  _DWORD *v3;
  int v4;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!self->_mattingProcessor
    && (-[BWMattingInferenceProvider _loadMattingProcessor]((uint64_t)self)
     || -[BWMattingInferenceProvider _configureMattingProcessor]((uint64_t)self)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v4 = -31702;
  }
  else
  {
    v4 = 0;
  }
  if (*v3 == 1)
    kdebug_trace();
  return v4;
}

- (uint64_t)_loadMattingProcessor
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v5 = 0;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/VideoProcessors/MattingV1.bundle"));
    if (v2)
    {
      v3 = v2;
      if (!objc_msgSend(v2, "loadAndReturnError:", &v5))
        return 4294954510;
      v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "principalClass")), "initWithCommandQueue:", *(_QWORD *)(v1 + 96));
      *(_QWORD *)(v1 + 88) = v4;
      if (v4)
        return 0;
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (uint64_t)_configureMattingProcessor
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  id v15;
  int v16;
  _DWORD v17[6];
  uint64_t v18;

  if (result)
  {
    v1 = (id *)result;
    v2 = -[BWMattingInferenceProvider processorOptionsDictionary](result);
    if (v2)
    {
      objc_msgSend(v1[11], "setOptions:", v2);
      v3 = objc_msgSend(v1[1], "videoFormat");
      if (v3
        && (v4 = (void *)v3, (v5 = objc_msgSend(v1[3], "videoFormat")) != 0)
        && (v6 = (void *)v5, (v7 = objc_msgSend(v1[2], "videoFormat")) != 0))
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(v4, "width");
        v10 = objc_msgSend(v4, "height");
        v11 = objc_msgSend(v6, "width");
        v12 = objc_msgSend(v6, "height");
        v13 = objc_msgSend(v8, "width");
        v14 = objc_msgSend(v8, "height");
        v15 = v1[11];
        v17[0] = v9;
        v17[1] = v10;
        v17[2] = v11;
        v17[3] = v12;
        v17[4] = v13;
        v17[5] = v14;
        v18 = 0;
        objc_msgSend(v15, "setConfig:", v17);
        v16 = objc_msgSend(v1[11], "prepareToProcess:", 0);
        result = 0;
        if (v16)
          return FigSignalErrorAt();
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  _DWORD *v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGSize v20;
  const __CFDictionary *v21;
  void *AttachedInference;
  void *v23;
  id v24;
  const void *v25;
  uint64_t v26;
  CGRect v28;

  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v11 = (double *)MEMORY[0x1E0C9D628];
  if (self->_mattingProcessor)
  {
    v12 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_primaryFormatInputVideoRequirement);
    if (v12)
    {
      v13 = v12;
      v14 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_segmentationInputVideoRequirement);
      if (v14)
      {
        v15 = v14;
        v16 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_depthInputVideoRequirement);
        if (v16)
        {
          v17 = v16;
          v18 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_disparityInputVideoRequirement);
          if (v18)
          {
            v19 = v18;
            v20 = (CGSize)*((_OWORD *)v11 + 1);
            v28.origin = *(CGPoint *)v11;
            v28.size = v20;
            v21 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08798], 0);
            if (v21)
            {
              if (CGRectMakeWithDictionaryRepresentation(v21, &v28))
              {
                AttachedInference = (void *)BWInferenceGetAttachedInference(a3, 801, 0x1E4951058);
                objc_msgSend(AttachedInference, "count");
                v23 = (void *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_segmentationOutputVideoRequirement);
                if (!v23)
                {
                  v23 = (void *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_segmentationOutputVideoRequirement), "newPixelBuffer");
                  objc_msgSend(a4, "setPixelBuffer:forRequirement:", v23, self->_segmentationOutputVideoRequirement);
                  if (!v23)
                  {
                    v26 = FigSignalErrorAt();
                    goto LABEL_21;
                  }
                  CFRelease(v23);
                }
                v24 = a6;
                if (self->_refinedDepthOutputVideoRequirement)
                {
                  v25 = (const void *)objc_msgSend(a4, "pixelBufferForRequirement:");
                  if (!v25)
                  {
                    v25 = (const void *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_refinedDepthOutputVideoRequirement), "newPixelBuffer");
                    objc_msgSend(a4, "setPixelBuffer:forRequirement:", v25, self->_refinedDepthOutputVideoRequirement);
                    if (!v25)
                      goto LABEL_28;
                    CFRelease(v25);
                  }
                }
                else
                {
                  v25 = 0;
                }
                CVBufferSetAttachment((CVBufferRef)v23, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
                -[FigMatting setImagePixelBuffer:](self->_mattingProcessor, "setImagePixelBuffer:", v13);
                -[FigMatting setInputSegmentationPixelBuffer:](self->_mattingProcessor, "setInputSegmentationPixelBuffer:", v15);
                -[FigMatting setInputDepthPixelBuffer:](self->_mattingProcessor, "setInputDepthPixelBuffer:", v17);
                -[FigMatting setInputDisparityPixelBuffer:](self->_mattingProcessor, "setInputDisparityPixelBuffer:", v19);
                -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
                -[FigMatting setFaceLandmarks:](self->_mattingProcessor, "setFaceLandmarks:", AttachedInference);
                -[FigMatting setOutputMattePixelBuffer:](self->_mattingProcessor, "setOutputMattePixelBuffer:", v23);
                -[FigMatting setOutputRefinedDisparityPixelBuffer:](self->_mattingProcessor, "setOutputRefinedDisparityPixelBuffer:", v25);
                if (!-[FigMatting process](self->_mattingProcessor, "process"))
                {
                  -[FigMatting finishScheduling](self->_mattingProcessor, "finishScheduling");
                  v26 = 0;
LABEL_20:
                  a6 = v24;
                  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_21:
                  v11 = (double *)MEMORY[0x1E0C9D628];
                  goto LABEL_22;
                }
LABEL_28:
                v26 = FigSignalErrorAt();
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
  }
  v26 = FigSignalErrorAt();
LABEL_22:
  -[FigMatting setImagePixelBuffer:](self->_mattingProcessor, "setImagePixelBuffer:", 0, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  -[FigMatting setInputSegmentationPixelBuffer:](self->_mattingProcessor, "setInputSegmentationPixelBuffer:", 0);
  -[FigMatting setInputDepthPixelBuffer:](self->_mattingProcessor, "setInputDepthPixelBuffer:", 0);
  -[FigMatting setInputDisparityPixelBuffer:](self->_mattingProcessor, "setInputDisparityPixelBuffer:", 0);
  -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", *v11, v11[1], v11[2], v11[3]);
  -[FigMatting setFaceLandmarks:](self->_mattingProcessor, "setFaceLandmarks:", 0);
  -[FigMatting setOutputMattePixelBuffer:](self->_mattingProcessor, "setOutputMattePixelBuffer:", 0);
  -[FigMatting setOutputRefinedDisparityPixelBuffer:](self->_mattingProcessor, "setOutputRefinedDisparityPixelBuffer:", 0);
  if (*v10 == 1)
    kdebug_trace();
  if (a6)
    (*((void (**)(id, uint64_t, BWMattingInferenceProvider *))a6 + 2))(a6, v26, self);
  return v26;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  _DWORD *v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  BWInferenceVideoRequirement *refinedDepthOutputVideoRequirement;
  uint64_t v14;
  const void *v15;
  const void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  BWSampleBufferRemoveAttachedMedia(a6, 0x1E49511B8);
  v10 = objc_msgSend(a4, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", self->_segmentationOutputVideoRequirement, a6);
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_11;
  }
  v11 = (const void *)v10;
  v17 = *MEMORY[0x1E0D08660];
  v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0x10000);
  v12 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  CMSetAttachment(v11, (CFStringRef)*MEMORY[0x1E0D08730], v12, 1u);
  BWSampleBufferSetAttachedMedia(a6, 0x1E495AF38, (uint64_t)v11);
  refinedDepthOutputVideoRequirement = self->_refinedDepthOutputVideoRequirement;
  if (!refinedDepthOutputVideoRequirement)
    goto LABEL_9;
  v14 = objc_msgSend(a4, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", refinedDepthOutputVideoRequirement, a6);
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_9:
    v16 = v11;
    goto LABEL_10;
  }
  v15 = (const void *)v14;
  BWSampleBufferSetAttachedMedia(a6, 0x1E495AF58, v14);
  CFRelease(v11);
  v16 = v15;
LABEL_10:
  CFRelease(v16);
LABEL_11:
  if (*v9 == 1)
    kdebug_trace();
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  int result;
  uint64_t v5;

  result = -[BWMattingInferenceProvider _loadMattingProcessor]((uint64_t)self);
  if (!result)
  {
    v5 = -[BWMattingInferenceProvider processorOptionsDictionary]((uint64_t)self);
    if (v5)
    {
      -[FigMatting setOptions:](self->_mattingProcessor, "setOptions:", v5);
      return -[FigMatting prewarmWithTuningParameters:](self->_mattingProcessor, "prewarmWithTuningParameters:", 0);
    }
    else
    {
      return -31702;
    }
  }
  return result;
}

- (uint64_t)processorOptionsDictionary
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 72), "objectForKeyedSubscript:", CFSTR("MattingParameters")), "objectForKeyedSubscript:", CFSTR("MattingV1"));
    if (v2)
    {
      if (!*(_QWORD *)(v1 + 56))
      {
        v8 = *MEMORY[0x1E0D06188];
        v9 = v2;
        v4 = (void *)MEMORY[0x1E0C99D80];
        v5 = &v9;
        v6 = &v8;
        v7 = 1;
        return objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, v7);
      }
      v3 = *(_QWORD *)(v1 + 80);
      if (v3)
      {
        v10[0] = *MEMORY[0x1E0D06188];
        v10[1] = CFSTR("SDOFRenderingParameters");
        v11[0] = v2;
        v11[1] = v3;
        v4 = (void *)MEMORY[0x1E0C99D80];
        v5 = v11;
        v6 = v10;
        v7 = 2;
        return objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, v7);
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (NSArray)inputVideoRequirements
{
  return self->_inputVideoRequirements;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

@end
