@implementation BWVISOverscanPredictionNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWVISOverscanPredictionNode)initWithCameraInfoByPortType:(id)a3 delegate:(id)a4
{
  BWVISOverscanPredictionNode *v6;
  BWVISOverscanPredictionNode *v7;
  BWNodeInput *v8;
  BWNodeOutput *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWVISOverscanPredictionNode;
  v6 = -[BWNode init](&v11, sel_init);
  v7 = v6;
  if (a3)
  {
    if (v6)
    {
      v8 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v6);
      -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInput setPassthroughMode:](v8, "setPassthroughMode:", 1);
      -[BWNode addInput:](v7, "addInput:", v8);
      v9 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
      -[BWNodeOutput setFormatRequirements:](v9, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeOutput setPassthroughMode:](v9, "setPassthroughMode:", 1);
      -[BWNode addOutput:](v7, "addOutput:", v9);
      v7->_delegate = (BWVISOverscanPredictionDelegate *)a4;
      v7->_cameraInfoByPortType = (NSDictionary *)a3;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVISOverscanPredictionNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("VISOverscanPredictor");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  GVSOverscanPredictor *visOverscanPredictor;
  NSDictionary *v4;
  NSDictionary *v5;
  float v11;
  GVSOverscanPredictor *v12;
  NSDictionary *cameraInfoByPortType;
  GVSOverscanPredictor *v14;
  uint64_t v15;
  _QWORD v16[3];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWVISOverscanPredictionNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v17, sel_prepareForCurrentConfigurationToBecomeLive);
  visOverscanPredictor = self->_visOverscanPredictor;
  if (visOverscanPredictor)

  v4 = -[BWVideoFormat pixelBufferAttributes](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "pixelBufferAttributes");
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    return;
  }
  v5 = v4;
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "floatValue");
  __asm { FMOV            V1.2S, #-1.0 }
  *((float *)&_D1 + 1) = v11 * 0.025;
  v15 = _D1;
  v12 = [GVSOverscanPredictor alloc];
  cameraInfoByPortType = self->_cameraInfoByPortType;
  v16[0] = 1045220557;
  v16[1] = v15;
  v16[2] = 1065353216;
  v14 = -[GVSOverscanPredictor initWithConfig:cameraInfoByPortType:visInputPixelBufferAttributes:](v12, "initWithConfig:cameraInfoByPortType:visInputPixelBufferAttributes:", v16, cameraInfoByPortType, v5);
  self->_visOverscanPredictor = v14;
  if (!v14)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  CFTypeRef v7;
  void *v8;
  __CVBuffer *ImageBuffer;
  CGFloat Width;
  __CVBuffer *v11;
  uint64_t v12;
  CGSize v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v20;
  CGRect rect;

  if (a3 && (v7 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0)
  {
    v8 = (void *)v7;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    Width = (double)CVPixelBufferGetWidth(ImageBuffer);
    v11 = CMSampleBufferGetImageBuffer(a3);
    rect.origin.x = 0.0;
    rect.origin.y = 0.0;
    rect.size.width = Width;
    rect.size.height = (double)CVPixelBufferGetHeight(v11);
    v12 = *MEMORY[0x1E0D06F48];
    if (objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]))
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v8, "objectForKeyedSubscript:", v12), &rect);
    v13 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v20.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v20.size = v13;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), &v20);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    v20.origin.x = v14;
    v20.origin.y = v15;
    v20.size.width = v16;
    v20.size.height = v17;
    -[BWVISOverscanPredictionDelegate visOverscanPredictor:allowsReducedOverscan:](self->_delegate, "visOverscanPredictor:allowsReducedOverscan:", self, -[GVSOverscanPredictor predictOverscanFitsFromMetadata:finalCropRect:boundingRect:](self->_visOverscanPredictor, "predictOverscanFitsFromMetadata:finalCropRect:boundingRect:", v8));
  }
  else
  {
    fig_log_get_emitter();
    v19 = v4;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v18, v19);
}

@end
