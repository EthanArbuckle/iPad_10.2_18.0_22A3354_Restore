@implementation BWStillImageMetalBlurMapRenderer

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageMetalBlurMapRenderer)initWithSDOFRenderingTuningParameters:(id)a3 imageDimensions:(id)a4 depthDataMapDimensions:(id)a5 portraitRenderQuality:(int)a6 metalCommandQueue:(id)a7 backPressureDrivenPipelining:(BOOL)a8
{
  BWStillImageMetalBlurMapRenderer *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BWStillImageMetalBlurMapRenderer;
  v14 = -[BWStillImageMetalBlurMapRenderer init](&v16, sel_init);
  if (v14)
  {
    v14->_sdofRenderingTuningParameters = (NSDictionary *)a3;
    v14->_imageDimensions = ($470D365275581EF16070F5A11344F73E)a4;
    v14->_depthDataMapDimensions = ($470D365275581EF16070F5A11344F73E)a5;
    v14->_portraitRenderQuality = a6;
    v14->_mtlCommandQueue = (MTLCommandQueue *)a7;
    v14->_backPressureDrivenPipelining = a8;
    -[BWStillImageMetalBlurMapRenderer _loadAndConfigureSDOFBlurMapRenderer]((uint64_t)v14);
  }
  return v14;
}

- (uint64_t)_loadAndConfigureSDOFBlurMapRenderer
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (result)
  {
    v1 = result;
    v12 = 0;
    v2 = (void *)-[BWStillImageMetalBlurMapRenderer bundleOptionsDictionary](result);
    if (!v2)
      goto LABEL_16;
    v3 = v2;
    v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06188]);
    if (!v4 || (v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06190])) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v6 = objc_msgSend(v5, "intValue");
    v7 = v6 >= 5 ? 5 : v6;
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors"), CFSTR("SDOFRendering"), v7, v12);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
    if (!v9)
    {
LABEL_16:
      fig_log_get_emitter();
LABEL_20:
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v10 = v9;
    if (objc_msgSend(v9, "loadAndReturnError:", &v12))
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "classNamed:", CFSTR("FigSDOFBlurMapRendering"))), "initWithCommandQueue:", *(_QWORD *)(v1 + 56));
      *(_QWORD *)(v1 + 16) = v11;
      if (v11
        && !objc_msgSend(v11, "setOptions:", v3)
        && (objc_msgSend(*(id *)(v1 + 16), "allocateResourcesForInputImageWidth:inputImageHeight:shiftMapWidth:shiftMapHeight:enableForegroundBlur:", *(int *)(v1 + 40), *(int *)(v1 + 44), *(int *)(v1 + 48), *(int *)(v1 + 52), objc_msgSend((id)v1, "shouldEnableForegroundBlur")) & 1) != 0)
      {
        return 0;
      }
      fig_log_get_emitter();
      goto LABEL_20;
    }
    return 4294954510;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageMetalBlurMapRenderer;
  -[BWStillImageMetalBlurMapRenderer dealloc](&v3, sel_dealloc);
}

- (signed)type
{
  return 1;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("SDOF Metal Renderer");
}

- (BOOL)shouldEnableForegroundBlur
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = (void *)-[BWStillImageMetalBlurMapRenderer bundleOptionsDictionary]((uint64_t)self);
  if (v2
    && (v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06188])) != 0
    && (v4 = v3, (v5 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06190])) != 0)
    && (v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "unsignedIntValue")),
        (v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderingV%@"), v6)) != 0)
    && (v8 = v7, (v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderingV%@_NMP"), v6)) != 0))
  {
    v10 = v9;
    v11 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", CFSTR("fgNRings"));
    v12 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v10), "objectForKeyedSubscript:", CFSTR("fgNRings"));
    if (v11 && objc_msgSend(v11, "unsignedIntValue"))
      return 1;
    if (v12)
      return objc_msgSend(v12, "unsignedIntValue") != 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  return 0;
}

- (uint64_t)bundleOptionsDictionary
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = *(_QWORD *)(result + 8);
    if (v1)
    {
      v2 = *MEMORY[0x1E0D06188];
      v3[0] = v1;
      return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  int v7;
  int v8;
  int v9;
  int v10;

  if (!self->_blurMapPixelBufferPool)
  {
    v7 = objc_msgSend(a4, "width", a3);
    if (v7 >= 0)
      v8 = v7;
    else
      v8 = v7 + 1;
    v9 = objc_msgSend(a4, "height");
    if (v9 >= 0)
      v10 = v9;
    else
      v10 = v9 + 1;
    -[BWStillImageMetalBlurMapRenderer _allocateBlurMapPixelBufferPoolForBuffersOfWidth:height:enableForegroundBlur:]((uint64_t)self, (uint64_t)v8 >> 1, (uint64_t)v10 >> 1, -[BWStillImageMetalBlurMapRenderer shouldEnableForegroundBlur](self, "shouldEnableForegroundBlur"));
  }
  return 0;
}

- (uint64_t)_allocateBlurMapPixelBufferPoolForBuffersOfWidth:(uint64_t)a3 height:(int)a4 enableForegroundBlur:
{
  uint64_t v6;
  uint64_t v7;
  BWVideoFormatRequirements *v8;
  id v9;
  uint64_t v10;
  BWPixelBufferPool *v11;
  BWMemoryPool *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BWVideoFormatRequirements *v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_QWORD *)(a1 + 24))
  {
    if (a4)
      v6 = 843264056;
    else
      v6 = 1278226488;
    v21[0] = *MEMORY[0x1E0CA90E0];
    v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
    v21[1] = *MEMORY[0x1E0CA8FD8];
    v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v21[2] = *MEMORY[0x1E0CA9040];
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v21[3] = *MEMORY[0x1E0CA8FF0];
    v22[2] = v7;
    v22[3] = MEMORY[0x1E0C9AA70];
    v8 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
    v20 = v8;
    v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1));

    v18 = *MEMORY[0x1E0CA8C68];
    v16 = *MEMORY[0x1E0CA8E98];
    v17 = *MEMORY[0x1E0CA8EB8];
    v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v11 = [BWPixelBufferPool alloc];
    v12 = +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool");
    LOBYTE(v15) = *(_BYTE *)(a1 + 32);
    v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:](v11, "initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:", v9, 2, CFSTR("Still Image Blur Map Pool"), v12, v10, v15);
    *(_QWORD *)(a1 + 24) = v13;
    if (!v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return 0;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v13;
  opaqueCMSampleBuffer *v14;
  CVImageBufferRef v15;
  __CVBuffer *v16;
  opaqueCMSampleBuffer *v17;
  CVImageBufferRef v18;
  opaqueCMSampleBuffer *v19;
  CVImageBufferRef v20;
  opaqueCMSampleBuffer *v21;
  CVImageBufferRef v22;
  CVImageBufferRef v23;

  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("Depth"));
  if (!AttachedMedia || (ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_6;
  }
  v13 = ImageBuffer;
  v14 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E495AF38);
  if (v14)
    v15 = CMSampleBufferGetImageBuffer(v14);
  else
    v15 = 0;
  v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E495AF58);
  if (v17)
    v18 = CMSampleBufferGetImageBuffer(v17);
  else
    v18 = 0;
  v19 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("PersonSemanticsHair"));
  if (v19)
    v20 = CMSampleBufferGetImageBuffer(v19);
  else
    v20 = 0;
  v21 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("PersonSemanticsGlasses"));
  if (v21)
    v22 = CMSampleBufferGetImageBuffer(v21);
  else
    v22 = 0;
  if (!self->_sdofBlurMapRenderer || !self->_blurMapPixelBufferPool)
  {
LABEL_6:
    v16 = 0;
    if (!a8)
      goto LABEL_26;
LABEL_25:
    (*((void (**)(id, _QWORD, _QWORD))a8 + 2))(a8, 0, 0);
    goto LABEL_26;
  }
  -[FigSDOFBlurMapRendering setFaceLandmarksArray:](self->_sdofBlurMapRenderer, "setFaceLandmarksArray:", BWInferenceGetAttachedInference(a5, 801, 0x1E4951058));
  v16 = -[BWPixelBufferPool newPixelBuffer](self->_blurMapPixelBufferPool, "newPixelBuffer");
  if (v18)
    v23 = v18;
  else
    v23 = v13;
  if (!-[FigSDOFBlurMapRendering computeBlurMapWithImage:shiftMap:personSegmentationMask:hairSemanticSegmentationMask:glassesSemanticSegmentationMask:resultFaceAdjustedBlurMap:](self->_sdofBlurMapRenderer, "computeBlurMapWithImage:shiftMap:personSegmentationMask:hairSemanticSegmentationMask:glassesSemanticSegmentationMask:resultFaceAdjustedBlurMap:", a5, v23, v15, v20, v22, v16))
  {
    CMSetAttachment(a5, CFSTR("PortraitStillImageFaceAdjustedBlurMap"), v16, 1u);
    if (!a8)
      goto LABEL_26;
    goto LABEL_25;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  if (a8)
    goto LABEL_25;
LABEL_26:
  if (v16)
    CFRelease(v16);
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

@end
