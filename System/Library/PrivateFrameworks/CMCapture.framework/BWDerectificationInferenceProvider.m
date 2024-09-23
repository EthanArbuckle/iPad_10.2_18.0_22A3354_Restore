@implementation BWDerectificationInferenceProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWDerectificationInferenceProvider)initWithInputRequirement:(id)a3 opticalFlowInputRequirement:(id)a4 outputRequirement:(id)a5 resourceProvider:(id)a6 configuration:(id)a7
{
  BWDerectificationInferenceProvider *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWDerectificationInferenceProvider;
  v12 = -[BWDerectificationInferenceProvider init](&v14, sel_init);
  if (v12)
  {
    v12->_metalInferenceContext = (BWMetalInferenceContext *)(id)objc_msgSend(a6, "defaultDeviceMetalContext");
    v12->_outputRequirement = (BWInferenceVideoRequirement *)a5;
    v12->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v12->_opticalFlowInputRequirement = (BWInferenceVideoRequirement *)a4;
    v12->_portType = (NSString *)(id)objc_msgSend(a7, "portType");
    v12->_lastIsQsubFrame = 0;
    v12->_applyRollingShutterCorrection = 1;
    v12->_canonicalDisparityScaleFactorOverride = 0.0;
  }
  return v12;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWDerectificationInferenceProvider;
  -[BWDerectificationInferenceProvider dealloc](&v4, sel_dealloc);
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  BWInferenceVideoFormat *v4;
  GDCTransform *v5;
  id v6;
  BWInferenceVideoRequirement *opticalFlowInputRequirement;
  MTLTextureDescriptor *v8;
  PTDisparityPostProcessing *disparityPostProcessor;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  id v16;
  MTLCommandQueue *v17;
  NSString *portType;
  PTDisparityPostProcessing *v19;
  void *v20;
  MTLTexture *v21;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  uint64_t v26;

  v4 = -[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat", a3);
  self->_inputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), 0);
  self->_outputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), 0);
  -[MTLTextureDescriptor setUsage:](self->_inputDescriptor, "setUsage:", 1);
  -[MTLTextureDescriptor setUsage:](self->_outputDescriptor, "setUsage:", 2);
  v5 = (GDCTransform *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B38]), "initWithOptionalCommandQueue:", -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"));
  self->_gdcTransform = v5;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    LODWORD(opticalFlowInputRequirement) = -31702;
    return (int)opticalFlowInputRequirement;
  }
  v26 = 0;
  v6 = (id)-[MTLDevice newDefaultLibraryWithBundle:error:](-[BWMetalInferenceContext device](self->_metalInferenceContext, "device"), "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), &v26);
  if (v6)
  {
    self->_cropPipelineState = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](-[BWMetalInferenceContext device](self->_metalInferenceContext, "device"), "newComputePipelineStateWithFunction:error:", (id)objc_msgSend(v6, "newFunctionWithName:", CFSTR("depthPadding")), &v26);
    opticalFlowInputRequirement = self->_opticalFlowInputRequirement;
    if (!opticalFlowInputRequirement)
      return (int)opticalFlowInputRequirement;
    v8 = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](opticalFlowInputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_opticalFlowInputRequirement, "videoFormat"), "height"), 0);
    self->_opticalFlowInputDescriptor = v8;
    -[MTLTextureDescriptor setUsage:](v8, "setUsage:", 1);
    disparityPostProcessor = self->_disparityPostProcessor;
    if (disparityPostProcessor)

    v10 = -[MTLTextureDescriptor width](self->_inputDescriptor, "width");
    v11 = -[MTLTextureDescriptor height](self->_inputDescriptor, "height");
    v12 = -[MTLTextureDescriptor width](self->_opticalFlowInputDescriptor, "width");
    v13 = -[MTLTextureDescriptor height](self->_opticalFlowInputDescriptor, "height");
    v14 = -[MTLTextureDescriptor width](self->_inputDescriptor, "width");
    v15 = -[MTLTextureDescriptor height](self->_inputDescriptor, "height");
    v16 = objc_alloc((Class)getPTDisparityPostProcessingClass());
    v17 = -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue");
    portType = self->_portType;
    v25[0] = v10;
    v25[1] = v11;
    v25[2] = 1;
    v24[0] = v14;
    v24[1] = v15;
    v24[2] = 1;
    v23[0] = v12;
    v23[1] = v13;
    v23[2] = 1;
    v19 = (PTDisparityPostProcessing *)objc_msgSend(v16, "initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v17, v25, v24, 25, v23, 71, portType);
    self->_disparityPostProcessor = v19;
    if (v19)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, v14, v15, 0);
      objc_msgSend(v20, "setUsage:", 3);
      objc_msgSend(v20, "setResourceOptions:", 32);
      v21 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](-[BWMetalInferenceContext device](self->_metalInferenceContext, "device"), "newTextureWithDescriptor:", v20);
      LODWORD(opticalFlowInputRequirement) = 0;
      self->_disparityIntermediate = v21;
      return (int)opticalFlowInputRequirement;
    }
    fig_log_get_emitter();
    goto LABEL_12;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  LODWORD(opticalFlowInputRequirement) = 0;
  return (int)opticalFlowInputRequirement;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  BWInferenceVideoRequirement *opticalFlowInputRequirement;
  const void *AttachedMedia;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  __CVBuffer *v16;
  void *v17;
  __CVBuffer *v18;
  MTLCommandQueue *v19;
  __CVBuffer *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  BOOL applyRollingShutterCorrection;
  unint64_t v33;
  float v34;
  unint64_t v35;
  float v36;
  float32x2_t v37;
  float v38;
  float canonicalDisparityScaleFactorOverride;
  _BOOL4 v40;
  uint64_t v41;
  double v42;
  int v43;
  GDCTransform *gdcTransform;
  MTLTexture *disparityIntermediate;
  double v46;
  __CVBuffer *v47;
  __CVBuffer *v48;
  void *v49;
  void *v50;
  void *v51;
  MTLTexture *v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  void *v57;
  unsigned int v58;
  id v59;
  id v60;
  __CVBuffer *cf;
  __CVBuffer *v62;
  void *v63;
  _QWORD v64[6];
  int v65;
  _QWORD v66[3];
  _QWORD v67[3];
  float32x4_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float32x2_t v71;
  double v72[24];
  _BYTE v73[160];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  opticalFlowInputRequirement = self->_opticalFlowInputRequirement;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  v13 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  if (!CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v63 = 0;
    v18 = 0;
    v14 = 0;
LABEL_43:
    v41 = 4294935582;
    goto LABEL_55;
  }
  v14 = (void *)CMGetAttachment(a3, v13, 0);
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v63 = 0;
    v18 = 0;
    goto LABEL_43;
  }
  v15 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputRequirement);
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v63 = 0;
    v18 = 0;
    v14 = 0;
    v41 = 4294935584;
    goto LABEL_55;
  }
  v16 = (__CVBuffer *)v15;
  v17 = (void *)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_outputRequirement);
  v18 = (__CVBuffer *)objc_msgSend(v17, "newPixelBuffer");
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v63 = 0;
    v14 = 0;
    v41 = 4294935578;
    goto LABEL_55;
  }
  v57 = v17;
  v19 = -[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue");
  cf = v18;
  v62 = (__CVBuffer *)objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_inputDescriptor, CVPixelBufferGetIOSurface(v16), 0);
  v63 = (void *)objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_outputDescriptor, CVPixelBufferGetIOSurface(v18), 0);
  v59 = a4;
  v60 = a7;
  if (opticalFlowInputRequirement)
  {
    v20 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_opticalFlowInputRequirement);
    if (!v20)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v21 = 0;
      v41 = 4294935584;
      v14 = v18;
      v18 = v62;
      goto LABEL_55;
    }
    v21 = (void *)objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_opticalFlowInputDescriptor, CVPixelBufferGetIOSurface(v20), 0);
  }
  else
  {
    v21 = 0;
  }
  v18 = v62;
  v79 = 0;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v74 = 0u;
  memset(v73, 0, sizeof(v73));
  memset(v72, 0, 184);
  v71 = 0;
  v22 = (void *)CMGetAttachment(a3, CFSTR("unrectifyData"), 0);
  v23 = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("refRollingShutterRowCount")), "intValue");
  objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("refRollingShutterHomographyStep")), "floatValue");
  v25 = v24;
  objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("gdcParametersReference")), "getValue:", v73);
  objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("calModel")), "getValue:", v72);
  v26 = (void *)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("orientationVector"));
  if (objc_msgSend(v26, "length") != 8)
  {
    fig_log_get_emitter();
LABEL_50:
    FigDebugAssert3();
    v41 = 4294935595;
LABEL_54:
    a7 = v60;
    v14 = cf;
LABEL_55:
    if (a7)
      (*((void (**)(id, uint64_t, BWDerectificationInferenceProvider *))a7 + 2))(a7, v41, self);
    v49 = 0;
    if (v14)
      goto LABEL_39;
    goto LABEL_40;
  }
  objc_msgSend(v26, "getBytes:length:", &v71, 8);
  HIDWORD(v27) = v71.i32[1];
  if (v71.f32[0] < 0.0)
    goto LABEL_51;
  LODWORD(v27) = v71.i32[1];
  if (v71.f32[1] < 0.0)
    goto LABEL_51;
  v28 = (void *)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("refRollingShutterCorrectionHomographiesInv"), v27);
  if (objc_msgSend(v28, "length") != 48 * (int)v23)
  {
    fig_log_get_emitter();
    goto LABEL_50;
  }
  v29 = objc_msgSend(v28, "bytes");
  v30 = (double)(unint64_t)objc_msgSend(v63, "width");
  v31 = (double)(unint64_t)objc_msgSend(v63, "height");
  *((double *)&v74 + 1) = v30;
  *(double *)&v75 = v31;
  BYTE8(v75) = 1;
  HIDWORD(v75) = 1;
  applyRollingShutterCorrection = self->_applyRollingShutterCorrection;
  if (applyRollingShutterCorrection)
  {
    *(_QWORD *)&v76 = v29;
    *((_QWORD *)&v76 + 1) = __PAIR64__(v25, v23);
    LOBYTE(v77) = applyRollingShutterCorrection;
  }
  v33 = -[__CVBuffer width](v62, "width");
  v34 = v72[19];
  *(float *)&v58 = (float)v33 / v34;
  v35 = -[__CVBuffer height](v62, "height");
  v36 = v72[20];
  v37 = vmul_f32(v71, (float32x2_t)__PAIR64__((float)v35 / v36, v58));
  v38 = v72[18] / sqrtf(vaddv_f32(vmul_f32(v37, v37)));
  if (self->_canonicalDisparityScaleFactorOverride == 0.0)
    canonicalDisparityScaleFactorOverride = v38;
  else
    canonicalDisparityScaleFactorOverride = self->_canonicalDisparityScaleFactorOverride;
  v40 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1;
  if (self->_lastIsQsubFrame == v40 || !opticalFlowInputRequirement)
  {
    self->_lastIsQsubFrame = v40;
    v41 = -[MTLCommandQueue commandBuffer](v19, "commandBuffer");
    gdcTransform = self->_gdcTransform;
    if (opticalFlowInputRequirement)
    {
      disparityIntermediate = self->_disparityIntermediate;
      v43 = 1;
      goto LABEL_25;
    }
    v43 = 0;
  }
  else
  {
    -[PTDisparityPostProcessing reset](self->_disparityPostProcessor, "reset");
    self->_lastIsQsubFrame = v40;
    v41 = -[MTLCommandQueue commandBuffer](v19, "commandBuffer");
    v43 = 0;
    gdcTransform = self->_gdcTransform;
  }
  disparityIntermediate = (MTLTexture *)v63;
LABEL_25:
  *(float *)&v42 = canonicalDisparityScaleFactorOverride;
  if (-[GDCTransform transformFrom:to:withParameters:withScale:withMode:andCommandBuffer:](gdcTransform, "transformFrom:to:withParameters:withScale:withMode:andCommandBuffer:", v62, disparityIntermediate, v73, 2, v41, v42))
  {
LABEL_51:
    fig_log_get_emitter();
    FigDebugAssert3();
    v41 = 4294935556;
    goto LABEL_54;
  }
  v70 = 0u;
  v69 = 0u;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    if (!v43
      || (LODWORD(v46) = 0,
          !-[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:](self->_disparityPostProcessor, "temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:", v41, self->_disparityIntermediate, v21, self->_disparityIntermediate, v63, v46)))
    {
      v14 = 0;
      v49 = 0;
      v48 = cf;
      goto LABEL_34;
    }
    goto LABEL_53;
  }
  v47 = (__CVBuffer *)objc_msgSend(v57, "newPixelBuffer");
  if (!v47)
  {
LABEL_53:
    fig_log_get_emitter();
    FigDebugAssert3();
    v41 = 4294935578;
    goto LABEL_54;
  }
  v48 = v47;
  v49 = (void *)objc_msgSend((id)-[MTLCommandQueue device](v19, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_outputDescriptor, CVPixelBufferGetIOSurface(v47), 0);
  v50 = (void *)objc_msgSend((id)v41, "computeCommandEncoder");
  v51 = v50;
  v52 = (MTLTexture *)v63;
  if (v43)
    v52 = self->_disparityIntermediate;
  objc_msgSend(v50, "setTexture:atIndex:", v52, 0);
  objc_msgSend(v51, "setTexture:atIndex:", v49, 1);
  v68 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v69, *(float64x2_t *)&v72[19])), vdivq_f64(v70, *(float64x2_t *)&v72[19]));
  objc_msgSend(v51, "setBytes:length:atIndex:", &v68, 16, 0);
  objc_msgSend(v51, "setComputePipelineState:", self->_cropPipelineState);
  v53 = -[MTLComputePipelineState threadExecutionWidth](self->_cropPipelineState, "threadExecutionWidth");
  v54 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_cropPipelineState, "maxTotalThreadsPerThreadgroup")/ v53;
  v67[0] = objc_msgSend(v63, "width");
  v67[1] = objc_msgSend(v63, "height");
  v67[2] = 1;
  v66[0] = v53;
  v66[1] = v54;
  v66[2] = 1;
  objc_msgSend(v51, "dispatchThreads:threadsPerThreadgroup:", v67, v66);
  objc_msgSend(v51, "endEncoding");
  v14 = v48;
  v18 = v62;
LABEL_34:
  objc_msgSend(v59, "setPixelBuffer:forRequirement:", v48, self->_outputRequirement);
  if (*MEMORY[0x1E0CA1FC0])
  {
    v55 = (void *)objc_msgSend((id)objc_msgSend((id)v41, "commandQueue"), "commandBuffer");
    objc_msgSend(v55, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
    objc_msgSend(v55, "addCompletedHandler:", &__block_literal_global_18);
    objc_msgSend(v55, "commit");
    objc_msgSend((id)v41, "addCompletedHandler:", &__block_literal_global_59);
  }
  if (v60)
  {
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_3;
    v64[3] = &unk_1E491EA20;
    v65 = 0;
    v64[4] = self;
    v64[5] = v60;
    objc_msgSend((id)v41, "addScheduledHandler:", v64);
  }
  objc_msgSend((id)v41, "commit");
  CFRelease(cf);
  LODWORD(v41) = 0;
  if (v14)
LABEL_39:
    CFRelease(v14);
LABEL_40:

  return v41;
}

uint64_t __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

uint64_t __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  if (objc_msgSend(a2, "status") == 4)
  {
    objc_msgSend(a2, "GPUEndTime");
    result = objc_msgSend(a2, "GPUStartTime");
  }
  else
  {
    result = objc_msgSend(a2, "status");
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

uint64_t __120__BWDerectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  BWInferenceProviderStorage *v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = [BWInferenceProviderStorage alloc];
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_inputRequirement, self->_opticalFlowInputRequirement, 0);
  v6[0] = self->_outputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

- (int)type
{
  return 112;
}

- (NSArray)inputVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_inputRequirement, self->_opticalFlowInputRequirement, 0);
}

- (NSArray)outputVideoRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_outputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
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
