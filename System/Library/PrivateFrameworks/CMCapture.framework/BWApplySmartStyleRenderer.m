@implementation BWApplySmartStyleRenderer

+ (void)initialize
{
  objc_opt_class();
}

- (BWApplySmartStyleRenderer)initWithMetalCommandQueue:(id)a3 smartStyleRenderingVersion:(int)a4
{
  BWApplySmartStyleRenderer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWApplySmartStyleRenderer;
  v6 = -[BWApplySmartStyleRenderer init](&v8, sel_init);
  if (v6)
  {
    v6->_mtlCommandQueue = (MTLCommandQueue *)a3;
    v6->_smartStyleRenderingVersion = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWApplySmartStyleRenderer;
  -[BWApplySmartStyleRenderer dealloc](&v3, sel_dealloc);
}

- (signed)type
{
  return 6;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("Apply Smart Style Renderer");
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  int v6;

  v6 = BWLoadCreateAndSetupMetalImageBufferProcessor((uint64_t)CFSTR("SmartStyle"), self->_smartStyleRenderingVersion, (uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("SmartStyle"), self->_smartStyleRenderingVersion, (uint64_t)&unk_1EE727A98, 0, 0, (uint64_t)self->_mtlCommandQueue, 0, &self->_smartStyleProcessor);
  if (!v6)
  {
    -[CMISmartStyleProcessor setInstanceLabel:](self->_smartStyleProcessor, "setInstanceLabel:", CFSTR("PortraitApply"));
    -[CMISmartStyleProcessor setUseLiveMetalAllocations:](self->_smartStyleProcessor, "setUseLiveMetalAllocations:", 1);
    -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills"));
    self->_smartStyleProcessorInputOutputClass = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorInputOutputV%d"), self->_smartStyleRenderingVersion));
  }
  return v6;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  uint64_t v8;
  CFTypeRef v14;
  void *v15;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef ImageBuffer;
  opaqueCMSampleBuffer *v18;
  CVImageBufferRef v19;
  double FinalCropRect;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  size_t Width;
  size_t Height;
  double x;
  double y;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v42;
  uint64_t v43;
  CGRect v44;

  v14 = CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v14)
    goto LABEL_18;
  v15 = (void *)v14;
  -[CMISmartStyleProcessor resetState](self->_smartStyleProcessor, "resetState");
  if ((BWStillImageProcessingFlagsForSampleBuffer(a5) & 0x800000) != 0)
  {
    v38 = 0;
    v39 = 0;
LABEL_15:

    v40 = 0;
    if (!a8)
      return;
    goto LABEL_16;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E495B2B8);
  if (!AttachedMedia)
    goto LABEL_18;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  v18 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E4936818);
  v19 = v18 ? CMSampleBufferGetImageBuffer(v18) : 0;
  FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = *MEMORY[0x1E0D06118];
  v28 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]);
  v29 = *MEMORY[0x1E0D061D0];
  if (!objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D061D0]))
    goto LABEL_18;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v27), "objectForKeyedSubscript:", v29), "doubleValue");
  v31 = v30;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, FinalCropRect, v22, v24, v26, v31);
  x = v44.origin.x;
  y = v44.origin.y;
  v36 = v44.size.width;
  v37 = v44.size.height;
  if (!CGRectIsNull(v44))
  {
    v38 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
    if (!v38)
    {
      fig_log_get_emitter();
      v43 = v8;
      LODWORD(v42) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(v38, "setInputUnstyledPixelBuffer:", a4, v42, v43);
    objc_msgSend(v38, "setInputMetadataDict:", v15);
    objc_msgSend(v38, "setInputUnstyledCropRect:", x, y, v36, v37);
    objc_msgSend(v38, "setInputStyleCoefficientsPixelBuffer:", ImageBuffer);
    objc_msgSend(v38, "setOutputStyledPixelBuffer:", a7);
    objc_msgSend(v38, "setOutputStyledCropRect:", x, y, v36, v37);
    objc_msgSend(v38, "setOutputGainMapPixelBuffer:", v19);
    objc_msgSend(v38, "setResidualsCalculationDisabled:", 1);
    -[CMISmartStyleProcessor setInputOutput:](self->_smartStyleProcessor, "setInputOutput:", v38);
    if (!-[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", 6)&& !-[CMISmartStyleProcessor process](self->_smartStyleProcessor, "process")&& !-[CMISmartStyleProcessor finishProcessing](self->_smartStyleProcessor, "finishProcessing"))
    {
      v39 = 2;
      goto LABEL_15;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
LABEL_18:
    v38 = 0;
  }

  v40 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -2, 0);
  v39 = 0;
  if (!a8)
    return;
LABEL_16:
  (*((void (**)(id, uint64_t, uint64_t))a8 + 2))(a8, v39, v40);
}

@end
