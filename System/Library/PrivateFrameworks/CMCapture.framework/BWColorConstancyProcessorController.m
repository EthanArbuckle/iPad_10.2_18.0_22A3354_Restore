@implementation BWColorConstancyProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWColorConstancyProcessorController)initWithConfiguration:(id)a3
{
  BWColorConstancyProcessorController *v4;
  void *v5;
  int SetupAndPrepare;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWColorConstancyProcessorController;
  v4 = -[BWStillImageProcessorController initWithName:type:configuration:](&v8, sel_initWithName_type_configuration_, CFSTR("ColourConstancy"), 17, a3);
  if (v4)
  {
    v4->_version = objc_msgSend(a3, "version");
    v4->_outputPixelFormat = FigCaptureCompressedPixelFormatForPixelFormat(1751527984, 4, objc_msgSend(a3, "lossyCompressionLevel"));
    v5 = (void *)MEMORY[0x1A858DD40]();
    SetupAndPrepare = -[BWColorConstancyProcessorController _loadSetupAndPrepareProcessor]((uint64_t)v4);
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
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (result)
  {
    v1 = (_QWORD *)result;
    if (!*(_QWORD *)(result + 64))
    {
      v2 = *(unsigned int *)(result + 56);
      v3 = (void *)objc_msgSend((id)objc_msgSend((id)result, "configuration"), "sensorConfigurationsByPortType");
      v4 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "metalCommandQueue");
      v5[1] = 3221225472;
      v5[2] = __68__BWColorConstancyProcessorController__loadSetupAndPrepareProcessor__block_invoke;
      v5[3] = &unk_1E49204F0;
      v5[4] = v1;
      v5[0] = MEMORY[0x1E0C809B0];
      result = BWLoadCreateAndSetupMetalImageBufferProcessor((uint64_t)CFSTR("ColourConstancy"), v2, (uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("ColourConstancy"), v2, (uint64_t)&unk_1EE727A38, 1, v3, v4, (uint64_t)v5, v1 + 8);
      if ((_DWORD)result)
        return result;
      objc_msgSend((id)v1[8], "setClippingRecoveryEnabled:", objc_msgSend((id)objc_msgSend(v1, "configuration"), "clippingRecoveryEnabled"));
      objc_msgSend((id)v1[8], "setSaturationBoostEnabled:", objc_msgSend((id)objc_msgSend(v1, "configuration"), "saturationBoostEnabled"));
    }
    return 0;
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *confidenceMapFormatDescription;
  objc_super v5;

  -[BWColorConstancyProcessorController reset](self, "reset");

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  confidenceMapFormatDescription = self->_confidenceMapFormatDescription;
  if (confidenceMapFormatDescription)
    CFRelease(confidenceMapFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)BWColorConstancyProcessorController;
  -[BWStillImageProcessorController dealloc](&v5, sel_dealloc);
}

- (void)input:(id)a3 addFlashFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWColorConstancyProcessorController _addFrame:type:]((uint64_t)self, a4, 1);
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (uint64_t)_addFrame:(uint64_t)a3 type:
{
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v7;
  CFTypeRef v8;
  CFTypeRef v9;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v11;
  CVImageBufferRef v12;
  CFTypeRef v13;
  uint64_t v14;

  if (!a1)
    return 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (ImageBuffer && (v7 = ImageBuffer, (v8 = CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0))
  {
    v9 = v8;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(sbuf, 0x1E495B158);
    v11 = AttachedMedia;
    if (AttachedMedia)
    {
      v12 = CMSampleBufferGetImageBuffer(AttachedMedia);
      v13 = CMGetAttachment(v11, (CFStringRef)*MEMORY[0x1E0D05C98], 0);
      v11 = (opaqueCMSampleBuffer *)objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMIColourConstancyFrameParamsV%d"), *(unsigned int *)(a1 + 56))));
      -[opaqueCMSampleBuffer setLscGains:](v11, "setLscGains:", v12);
      -[opaqueCMSampleBuffer setLscParams:](v11, "setLscParams:", v13);
    }
    v14 = objc_msgSend(*(id *)(a1 + 64), "addFrame:metadata:frameType:frameParams:", v7, v9, a3, v11);
  }
  else
  {
    v11 = 0;
    v14 = 4294954516;
  }

  return v14;
}

- (void)input:(id)a3 addAmbientFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWColorConstancyProcessorController _addFrame:type:]((uint64_t)self, a4, 0);
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (void)reset
{
  -[CMIColourConstancyProcessorProtocol resetState](self->_processor, "resetState");
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWColorConstancyProcessorControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWColorConstancyProcessorControllerRequest alloc], "initWithInput:delegate:", a3, a4);
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
  __CVBuffer *v5;
  int v6;

  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v4 = (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", self, -[BWStillImageProcessorControllerRequest input](v3, "input"), 1);
  if (!v4)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v5 = (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", self, -[BWStillImageProcessorControllerRequest input](v3, "input"), 2002);
  if (!v5)
  {
LABEL_6:
    v6 = -12786;
    goto LABEL_4;
  }
  -[CMIColourConstancyProcessorProtocol setOutputImagePixelBuffer:](self->_processor, "setOutputImagePixelBuffer:", v4);
  -[CMIColourConstancyProcessorProtocol setOutputImageMetadata:](self->_processor, "setOutputImageMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  -[CMIColourConstancyProcessorProtocol setOutputColourAccuracyConfidenceImagePixelBuffer:](self->_processor, "setOutputColourAccuracyConfidenceImagePixelBuffer:", v5);
  -[CMIColourConstancyProcessorProtocol setConfidenceMapMetadata:](self->_processor, "setConfidenceMapMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  v6 = -[CMIColourConstancyProcessorProtocol prepareToProcess:](self->_processor, "prepareToProcess:", 0);
LABEL_4:
  CVPixelBufferRelease(v4);
  CVPixelBufferRelease(v5);
  return v6;
}

- (int)process
{
  BWStillImageProcessorControllerRequest *v3;
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMAttachmentBearerRef v6;
  const void *v7;
  void *v8;
  const void *v9;
  const void *v10;
  const void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[23];

  v18[22] = *MEMORY[0x1E0C80C00];
  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v4 = -[CMIColourConstancyProcessorProtocol process](self->_processor, "process");
  if (dword_1ECFE9A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4
    || (v6 = -[BWColorConstancyProcessorController _newOutputSampleBufferFromSampleBuffer:pixelBuffer:confidenceMap:metadata:processingFlags:formatDescriptionInOut:](self, (opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input"), "flashFrame"), (__CVBuffer *)-[CMIColourConstancyProcessorProtocol outputImagePixelBuffer](self->_processor, "outputImagePixelBuffer"), (__CVBuffer *)-[CMIColourConstancyProcessorProtocol outputColourAccuracyConfidenceImagePixelBuffer](self->_processor, "outputColourAccuracyConfidenceImagePixelBuffer"), (void *)-[CMIColourConstancyProcessorProtocol outputImageMetadata](self->_processor, "outputImageMetadata"), 0, (CFTypeRef *)&self->_outputFormatDescription)) == 0)
  {
    v12 = (const void *)-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input", v15, v16), "flashFrame");
    v13 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v14 = (void *)objc_msgSend((id)CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
    CMSetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input"), "flashFrame"), v13, v14, 1u);

    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, -[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](v3, "input"), "flashFrame"), 1, -[BWStillImageProcessorControllerRequest input](v3, "input"), 0);
  }
  else
  {
    v7 = v6;
    v17 = *MEMORY[0x1E0D08350];
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[CMIColourConstancyProcessorProtocol outputCenterWeightedMeanColourAccuracyConfidenceLevel](self->_processor, "outputCenterWeightedMeanColourAccuracyConfidenceLevel");
    v18[0] = objc_msgSend(v8, "numberWithFloat:");
    v9 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    CMSetAttachment(v7, (CFStringRef)*MEMORY[0x1E0D086D8], v9, 1u);
    v10 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v7, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x80000);
    CMSetAttachment(v7, CFSTR("StillImageProcessingFlags"), v10, 1u);
    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v3, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, v7, 1, -[BWStillImageProcessorControllerRequest input](v3, "input"), 0);
    CFRelease(v7);
  }
  return 0;
}

- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(__CVBuffer *)a4 confidenceMap:(void *)a5 metadata:(int)a6 processingFlags:(CFTypeRef *)a7 formatDescriptionInOut:
{
  void *v7;
  int v8;
  CMAttachmentBearerRef v12;
  int CopyWithNewPixelBuffer;
  const __CFString *v14;
  uint64_t v15;
  CMAttachmentBearerRef target;

  if (result)
  {
    v7 = 0;
    target = 0;
    v8 = -12780;
    if (a2 && a3)
    {
      v12 = result;
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a7, (CMSampleBufferRef *)&target);
      if (CopyWithNewPixelBuffer)
      {
        v8 = CopyWithNewPixelBuffer;
        v7 = 0;
      }
      else
      {
        v14 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v7 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
        if (objc_msgSend(a5, "count"))
          objc_msgSend(v7, "addEntriesFromDictionary:", a5);
        CMSetAttachment(target, v14, v7, 1u);
        if (a6)
        {
          v15 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | a6;
          CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15), 1u);
        }
        BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1E495B438, a4, (CFTypeRef *)v12 + 10, objc_msgSend(*((id *)v12 + 8), "confidenceMapMetadata"), 0, 0);
        v8 = 0;
      }
    }

    result = target;
    if (v8)
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

uint64_t __68__BWColorConstancyProcessorController__loadSetupAndPrepareProcessor__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

@end
