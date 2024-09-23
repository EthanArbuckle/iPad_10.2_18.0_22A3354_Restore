@implementation BWStillImageMetalSDOFRenderer

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageMetalSDOFRenderer)initWithSDOFRenderingTuningParameters:(id)a3 imageDimensions:(id)a4 depthDataMapDimensions:(id)a5 portraitRenderQuality:(int)a6 metalCommandQueue:(id)a7
{
  char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWStillImageMetalSDOFRenderer;
  v12 = -[BWStillImageMetalSDOFRenderer init](&v14, sel_init);
  if (v12)
  {
    *((_QWORD *)v12 + 1) = a3;
    *($2825F4736939C4A6D3AD43837233062D *)(v12 + 28) = a4;
    *($2825F4736939C4A6D3AD43837233062D *)(v12 + 36) = a5;
    *((_DWORD *)v12 + 6) = a6;
    *((_QWORD *)v12 + 6) = a7;
    -[BWStillImageMetalSDOFRenderer _loadAndConfigureSDOFRenderer]((uint64_t)v12);
  }
  return (BWStillImageMetalSDOFRenderer *)v12;
}

- (uint64_t)_loadAndConfigureSDOFRenderer
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
    v2 = (void *)-[BWStillImageMetalSDOFRenderer bundleOptionsDictionary](result);
    if (!v2)
      goto LABEL_19;
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
LABEL_19:
      fig_log_get_emitter();
LABEL_23:
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v10 = v9;
    if (objc_msgSend(v9, "loadAndReturnError:", &v12))
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "classNamed:", CFSTR("FigSDOFEffectRendering"))), "initWithCommandQueue:", *(_QWORD *)(v1 + 48));
      *(_QWORD *)(v1 + 16) = v11;
      if (v11 && !objc_msgSend(v11, "setOptions:", v3))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_msgSend(*(id *)(v1 + 16), "allocateResourcesForInputImageWidth:inputImageHeight:shiftMapWidth:shiftMapHeight:enableForegroundBlur:", *(int *)(v1 + 28), *(int *)(v1 + 32), *(int *)(v1 + 36), *(int *)(v1 + 40), objc_msgSend((id)v1, "shouldEnableForegroundBlur")) & 1) != 0)return 0;
        }
        else if ((objc_msgSend(*(id *)(v1 + 16), "allocateResourcesForInputImageWidth:inputImageHeight:shiftMapWidth:shiftMapHeight:", *(int *)(v1 + 28), *(int *)(v1 + 32), *(int *)(v1 + 36), *(int *)(v1 + 40)) & 1) != 0)
        {
          return 0;
        }
      }
      fig_log_get_emitter();
      goto LABEL_23;
    }
    return 4294954510;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageMetalSDOFRenderer;
  -[BWStillImageMetalSDOFRenderer dealloc](&v3, sel_dealloc);
}

- (signed)type
{
  return 2;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("SDOF Metal Renderer");
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  return 0;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  CFTypeRef v13;
  CFTypeRef v14;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef v16;
  opaqueCMSampleBuffer *v17;
  CVImageBufferRef v18;
  uint64_t v19;

  v13 = CMGetAttachment(a5, CFSTR("PortraitStillImageFaceAdjustedBlurMap"), 0);
  if (v13)
  {
    v14 = v13;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E495AF38);
    v16 = AttachedMedia ? CMSampleBufferGetImageBuffer(AttachedMedia) : 0;
    v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E4936818);
    v18 = v17 ? CMSampleBufferGetImageBuffer(v17) : 0;
    if (!-[FigSDOFEffectRendering runSamplingWithImage:inputPixelBuffer:inputFaceAdjustedBlurMap:inputAlphaMask:inputGainMap:resultImage:](self->_sdofEffectRenderer, "runSamplingWithImage:inputPixelBuffer:inputFaceAdjustedBlurMap:inputAlphaMask:inputGainMap:resultImage:", a5, a4, v14, v16, v18, a7))
    {
      v19 = 2;
      if (!a8)
        return;
      goto LABEL_10;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v19 = 0;
  if (a8)
LABEL_10:
    (*((void (**)(id, uint64_t, _QWORD))a8 + 2))(a8, v19, 0);
}

- (uint64_t)bundleOptionsDictionary
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (*(_QWORD *)(result + 8))
    {
      v1 = *MEMORY[0x1E0D06188];
      v4[0] = *(_QWORD *)(result + 8);
      v2 = *MEMORY[0x1E0D08780];
      v3[0] = v1;
      v3[1] = v2;
      v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_DWORD *)(result + 24) != 0);
      return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
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

  v2 = (void *)-[BWStillImageMetalSDOFRenderer bundleOptionsDictionary]((uint64_t)self);
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

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

@end
