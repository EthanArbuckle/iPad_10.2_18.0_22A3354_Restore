@implementation BWSWFRProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWSWFRProcessorController)initWithConfiguration:(id)a3
{
  BWSWFRProcessorController *v4;
  void *v5;
  int SetupAndPrepare;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWSWFRProcessorController;
  v4 = -[BWStillImageProcessorController initWithName:type:configuration:](&v8, sel_initWithName_type_configuration_, CFSTR("SoftwareFlashRendering"), 15, a3);
  if (v4)
  {
    v4->_version = objc_msgSend(a3, "version");
    v4->_outputPixelFormat = FigCaptureCompressedPixelFormatForPixelFormat(1751527984, 4, objc_msgSend(a3, "lossyCompressionLevel"));
    v5 = (void *)MEMORY[0x1A858DD40]();
    SetupAndPrepare = -[BWSWFRProcessorController _loadSetupAndPrepareProcessor]((uint64_t)v4);
    objc_autoreleasePoolPop(v5);
    if (SetupAndPrepare)
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareProcessor
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 64))
    {
      return 0;
    }
    else
    {
      v2 = +[BWSWFRProcessorController _nrfVersionForSWFRVersion:]((uint64_t)BWSWFRProcessorController, *(_DWORD *)(result + 56));
      if (v2 == -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion"))
      {
        v3 = *(unsigned int *)(v1 + 56);
        v4 = (void *)objc_msgSend((id)objc_msgSend((id)v1, "configuration"), "sensorConfigurationsByPortType");
        v5 = objc_msgSend((id)objc_msgSend((id)v1, "configuration"), "metalCommandQueue");
        v6[1] = 3221225472;
        v6[2] = __58__BWSWFRProcessorController__loadSetupAndPrepareProcessor__block_invoke;
        v6[3] = &unk_1E49204F0;
        v6[4] = v1;
        v6[0] = MEMORY[0x1E0C809B0];
        return BWLoadCreateAndSetupMetalImageBufferProcessor((uint64_t)CFSTR("NRF"), v2, (uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("SoftwareFlashRendering"), v3, (uint64_t)&unk_1EE727AF8, 1, v4, v5, (uint64_t)v6, (_QWORD *)(v1 + 64));
      }
      else
      {
        return 4294954516;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *demosaicedRawFormatDescription;
  objc_super v5;

  -[BWSWFRProcessorController reset](self, "reset");

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  demosaicedRawFormatDescription = self->_demosaicedRawFormatDescription;
  if (demosaicedRawFormatDescription)
    CFRelease(demosaicedRawFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)BWSWFRProcessorController;
  -[BWStillImageProcessorController dealloc](&v5, sel_dealloc);
}

- (void)input:(id)a3 addFlashFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWSWFRProcessorController _addFrame:type:]((uint64_t)self, a4, 1);
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (uint64_t)_addFrame:(uint64_t)a3 type:
{
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v7;
  CFTypeRef v8;
  CFTypeRef v9;
  opaqueCMSampleBuffer *AttachedMedia;
  uint64_t v11;
  opaqueCMSampleBuffer *v12;
  CVImageBufferRef v13;
  CFTypeRef v14;
  id v15;
  uint64_t v16;

  if (!a1)
    return 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (ImageBuffer && (v7 = ImageBuffer, (v8 = CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0))
  {
    v9 = v8;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(sbuf, 0x1E495B158);
    v11 = BWSampleBufferGetAttachedMedia(sbuf, 0x1E495B178);
    if (AttachedMedia)
    {
      v12 = (opaqueCMSampleBuffer *)v11;
      v13 = CMSampleBufferGetImageBuffer(AttachedMedia);
      v14 = CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05C98], 0);
      v15 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISoftwareFlashRenderingFrameParamsV%d"), *(unsigned int *)(a1 + 56))));
      objc_msgSend(v15, "setLscGains:", v13);
      objc_msgSend(v15, "setLscParams:", v14);
      if (v12)
        objc_msgSend(v15, "setFlashLSCGains:", CMSampleBufferGetImageBuffer(v12));
    }
    else
    {
      v15 = 0;
    }
    v16 = objc_msgSend(*(id *)(a1 + 64), "addFrame:metadata:frameType:frameParams:", v7, v9, a3, v15);
  }
  else
  {
    v15 = 0;
    v16 = 4294954516;
  }

  return v16;
}

- (void)input:(id)a3 addAmbientFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWSWFRProcessorController _addFrame:type:]((uint64_t)self, a4, 0);
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (void)reset
{
  -[CMISoftwareFlashRenderingProcessor resetState](self->_processor, "resetState");
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWSWFRProcessorControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWSWFRProcessorControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  BWStillImageProcessorControllerRequest *v3;
  __CVBuffer *v4;
  int v5;

  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v4 = (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", self, -[BWStillImageProcessorControllerRequest input](v3, "input"), 1);
  if (v4)
  {
    -[CMISoftwareFlashRenderingProcessor setOutputImagePixelBuffer:](self->_processor, "setOutputImagePixelBuffer:", v4);
    -[CMISoftwareFlashRenderingProcessor setOutputImageMetadata:](self->_processor, "setOutputImageMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    if (-[BWStillImageProcessingSettings provideDemosaicedRaw](-[BWStillImageSettings processingSettings](-[BWStillImageProcessorControllerInput stillImageSettings](-[BWStillImageProcessorControllerRequest input](v3, "input"), "stillImageSettings"), "processingSettings"), "provideDemosaicedRaw"))
    {
      -[CMISoftwareFlashRenderingProcessor setLinearOutputImageMetadata:](self->_processor, "setLinearOutputImageMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    }
    v5 = -[CMISoftwareFlashRenderingProcessor prepareToProcess:](self->_processor, "prepareToProcess:", 0);
  }
  else
  {
    v5 = -12786;
  }
  CVPixelBufferRelease(v4);
  CVPixelBufferRelease(0);
  return v5;
}

- (int)process
{
  BWStillImageProcessorControllerRequest *v3;
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMAttachmentBearerRef v6;
  const void *v7;
  const void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v4 = -[CMISoftwareFlashRenderingProcessor process](self->_processor, "process");
  if (dword_1ECFE9A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4
    || (v6 = -[BWSWFRProcessorController _newOutputSampleBufferFromSampleBuffer:pixelBuffer:metadata:processingFlags:formatDescriptionInOut:](self, (opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input"), "flashFrame"), (__CVBuffer *)-[CMISoftwareFlashRenderingProcessor outputImagePixelBuffer](self->_processor, "outputImagePixelBuffer"), (void *)-[CMISoftwareFlashRenderingProcessor outputImageMetadata](self->_processor, "outputImageMetadata"), 0, (CFTypeRef *)&self->_outputFormatDescription)) == 0)
  {
    v9 = (const void *)-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input", v12, v13), "flashFrame");
    v10 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v11 = (void *)objc_msgSend((id)CMGetAttachment(v9, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
    CMSetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input"), "flashFrame"), v10, v11, 1u);

    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, -[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input"), "flashFrame"), 1, -[BWStillImageProcessorControllerRequest input](v3, "input"), 0);
  }
  else
  {
    v7 = v6;
    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, v6, 1, -[BWStillImageProcessorControllerRequest input](v3, "input"), 0);
    CFRelease(v7);
  }
  return 0;
}

- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(void *)a4 metadata:(int)a5 processingFlags:(CFTypeRef *)a6 formatDescriptionInOut:
{
  void *v6;
  int v7;
  int CopyWithNewPixelBuffer;
  const __CFString *v11;
  uint64_t v12;
  CMAttachmentBearerRef target;

  if (result)
  {
    v6 = 0;
    target = 0;
    v7 = -12780;
    if (a2 && a3)
    {
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a6, (CMSampleBufferRef *)&target);
      if (CopyWithNewPixelBuffer)
      {
        v7 = CopyWithNewPixelBuffer;
        v6 = 0;
      }
      else
      {
        v11 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v6 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
        if (objc_msgSend(a4, "count"))
          objc_msgSend(v6, "addEntriesFromDictionary:", a4);
        CMSetAttachment(target, v11, v6, 1u);
        if (a5)
        {
          v12 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | a5;
          CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12), 1u);
        }
        v7 = 0;
      }
    }

    result = target;
    if (v7)
    {
      if (target)
      {
        CFRelease(target);
        return 0;
      }
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_processor;
}

- (id)processorNewInferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISoftwareFlashRenderingInferencesV%d"), self->_version)));
  objc_msgSend(v4, "setStatus:", 0);
  v5 = (void *)-[BWStillImageProcessorControllerDelegate processorController:newInferencesForProcessorInput:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate"), "processorController:newInferencesForProcessorInput:", self, -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "inferenceBufferForAttachedMediaKey:", 0x1E49511B8);
    if (v7)
      objc_msgSend(v4, "setPersonMask:", v7);
    v8 = objc_msgSend(v6, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsSkin"));
    if (v8)
      objc_msgSend(v4, "setSkinMatte:", v8);
    v9 = objc_msgSend(v6, "inferenceBufferForAttachedMediaKey:", 0x1E495B0B8);
    if (v9)
      objc_msgSend(v4, "setSkyMatte:", v9);
  }
  else
  {
    objc_msgSend(v4, "setStatus:", 4294954516);
  }

  return v4;
}

+ (uint64_t)_nrfVersionForSWFRVersion:(uint64_t)a1
{
  uint64_t result;

  objc_opt_self();
  if ((a2 - 1) > 1)
    return 0xFFFFFFFFLL;
  LODWORD(result) = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
  if ((result - 5) < 0xFFFFFFFE)
    return 0xFFFFFFFFLL;
  else
    return result;
}

uint64_t __58__BWSWFRProcessorController__loadSetupAndPrepareProcessor__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

@end
