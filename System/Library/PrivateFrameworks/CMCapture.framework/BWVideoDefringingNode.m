@implementation BWVideoDefringingNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWVideoDefringingNode)initWithSensorIDString:(id)a3 portType:(id)a4 propagateSynchronizedSlaveFrame:(BOOL)a5 isSlomo:(BOOL)a6
{
  _BOOL4 v7;
  BWVideoDefringingNode *v10;
  BWVideoDefringingNode *v11;
  BWNodeInput *v12;
  BWVideoFormatRequirements *v13;
  BWNodeInputMediaConfiguration *v14;
  BWNodeOutput *v15;
  BWNodeOutputMediaConfiguration *v16;
  objc_super v18;

  v7 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BWVideoDefringingNode;
  v10 = -[BWNode init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isSlomo = a6;
    v10->_propagateSynchronizedSlaveFrame = v7;
    v12 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v10);
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A00818);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v12, "primaryMediaConfiguration"), "setFormatRequirements:", v13);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v12, "primaryMediaConfiguration"), "setPassthroughMode:", 2);
    if (v7)
    {
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", v13);
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v14, "setPassthroughMode:", 2);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v12, "setMediaConfiguration:forAttachedMediaKey:", v14, CFSTR("SynchronizedSlaveFrame"));
    }
    -[BWNode addInput:](v11, "addInput:", v12);

    v15 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v11);
    -[BWNodeOutput setFormatRequirements:](v15, "setFormatRequirements:", v13);
    -[BWNodeOutput setPassthroughMode:](v15, "setPassthroughMode:", 2);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v15, "primaryMediaConfiguration"), "setFormatRequirements:", v13);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v15, "primaryMediaConfiguration"), "setPassthroughMode:", 2);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](-[BWNodeOutput primaryMediaConfiguration](v15, "primaryMediaConfiguration"), "setProvidesPixelBufferPool:", 1);
    if (v7)
    {
      v16 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", v13);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 2);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v16, "setProvidesPixelBufferPool:", 1);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v16, CFSTR("SynchronizedSlaveFrame"));
    }
    -[BWNode addOutput:](v11, "addOutput:", v15);

    v11->_cameraToDefringe = (NSString *)a4;
    v11->_sensorIDString = (NSString *)a3;
    v11->_portType = (NSString *)a4;
    v11->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", CFSTR("BWVideoDefringingNode"), 10);
  }
  return v11;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWVideoDefringingNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("VideoDefringing");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutputMediaProperties *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("SynchronizedSlaveFrame")))
  {
    v9 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a5);
    v10 = objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat"));
    if (v9)
    {
      if ((v10 & 1) == 0)
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, self->super._output, a5, a5);
        goto LABEL_11;
      }
    }
    else
    {
      if (v10)
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ has no media properties for the primary format (provided media key is %@)"), self, self->super._output, a5, v12);
LABEL_11:
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
      }
      v9 = objc_alloc_init(BWNodeOutputMediaProperties);
      -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](self->super._output, "_setMediaProperties:forAttachedMediaKey:", v9, a5);
    }
    -[BWNodeOutputMediaProperties setResolvedFormat:](v9, "setResolvedFormat:", a3);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BWVideoDefringingNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v13, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoDefringingNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[BWVideoDefringingNode _loadAndConfigureVideoDefringingBundle]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureVideoDefringingBundle
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  uint64_t v14;

  v1 = a1;
  if (!a1)
    return v1;
  v14 = 0;
  v2 = -[BWVideoDefringingNode _processorOptions](a1);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/VideoProcessors/VideoDefringing.bundle"));
  if (!v3)
  {
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  v4 = v3;
  if (!objc_msgSend(v3, "loadAndReturnError:", &v14))
    return 4294954510;
  v5 = (objc_class *)objc_msgSend(v4, "classNamed:", CFSTR("FigVideoDefringingProcessor"));
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v6 = objc_msgSend([v5 alloc], "initWithCommandQueue:", 0);
  *(_QWORD *)(v1 + 136) = v6;
  if (!v6)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
  v7 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
  v10 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
  v11 = *(void **)(v1 + 136);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v13[3] = v10;
  objc_msgSend(v11, "setDefringeConfig:", v13);
  objc_msgSend(*(id *)(v1 + 136), "setOptions:", v2);
  v1 = objc_msgSend(*(id *)(v1 + 136), "prepareToProcess:", *(_BYTE *)(v1 + 96) == 0);
  if ((_DWORD)v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v1;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter", a3);
  -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CVBuffer *v11;
  uint64_t v12;
  CFTypeRef v13;
  uint64_t CopyWithNewPixelBuffer;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v16;
  uint64_t v17;
  __CVBuffer *v18;
  CMTime v19;
  CFTypeRef v20;
  CFTypeRef v21;
  CMAttachmentBearerRef cf;
  CMAttachmentBearerRef target;

  cf = 0;
  target = 0;
  v20 = 0;
  v21 = 0;
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
    return;
  }
  v6 = BWOverCaptureSampleBufferUnpackAndRetain(a3, 0, &target, &cf, 0, 0);
  if ((_DWORD)v6)
  {
    CopyWithNewPixelBuffer = v6;
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = 0;
    v16 = 0;
    goto LABEL_23;
  }
  v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v9 = (void *)CMGetAttachment(cf, v7, 0);
  v10 = *MEMORY[0x1E0D06D00];
  if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), "isEqualToString:", self->_cameraToDefringe))
  {
    v11 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("SynchronizedSlaveFrame")), "livePixelBufferPool"), "newPixelBuffer");
    -[FigVideoDefringingProcessor setInputSampleBuffer:](self->_videoDefringingProcessor, "setInputSampleBuffer:", target);
    -[FigVideoDefringingProcessor setOutputPixelBuffer:](self->_videoDefringingProcessor, "setOutputPixelBuffer:", v11);
    v12 = -[FigVideoDefringingProcessor process](self->_videoDefringingProcessor, "process");
    if (!(_DWORD)v12 && self->_videoDefringingProcessor)
    {
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v11, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&v21);
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
      CVBufferPropagateAttachments(ImageBuffer, v11);
      goto LABEL_13;
    }
    -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v12, CFSTR("defringed Wide Failed"));
    v13 = CFRetain(target);
LABEL_9:
    CopyWithNewPixelBuffer = 0;
    v21 = v13;
    goto LABEL_13;
  }
  if (target)
  {
    v13 = CFRetain(target);
    v11 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  CopyWithNewPixelBuffer = 0;
LABEL_13:
  if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v10), "isEqualToString:", self->_cameraToDefringe))
  {
    v16 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool"), "newPixelBuffer");
    -[FigVideoDefringingProcessor setInputSampleBuffer:](self->_videoDefringingProcessor, "setInputSampleBuffer:", cf);
    -[FigVideoDefringingProcessor setOutputPixelBuffer:](self->_videoDefringingProcessor, "setOutputPixelBuffer:", v16);
    v17 = -[FigVideoDefringingProcessor process](self->_videoDefringingProcessor, "process");
    if ((_DWORD)v17 || !self->_videoDefringingProcessor)
    {
      -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v17, CFSTR("defringed Narrow Failed"));
      v20 = CFRetain(cf);
    }
    else
    {
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)cf, v16, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&v20);
      v18 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)cf);
      CVBufferPropagateAttachments(v18, v16);
    }
  }
  else
  {
    v16 = 0;
    if (cf)
      v20 = CFRetain(cf);
  }
  if (v21)
    BWSampleBufferSetAttachedMedia(v20, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)v21);
  if (!(_DWORD)CopyWithNewPixelBuffer)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v20);
    goto LABEL_25;
  }
LABEL_23:
  CMSampleBufferGetPresentationTimeStamp(&v19, a3);
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F098, &v19));
  -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", CopyWithNewPixelBuffer, CFSTR("Error : Emitting dropped buffer"));
LABEL_25:
  if (target)
    CFRelease(target);
  if (cf)
    CFRelease(cf);
  if (v21)
    CFRelease(v21);
  if (v20)
    CFRelease(v20);
  if (v11)
    CFRelease(v11);
  if (v16)
    CFRelease(v16);
}

- (uint64_t)_processorOptions
{
  id v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = -[FigCaptureCameraParameters chromaticDefringingParametersForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "chromaticDefringingParametersForPortType:sensorIDString:", *(_QWORD *)(result + 112), *(_QWORD *)(result + 104));
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

@end
