@implementation BWNoiseReducerNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWNoiseReducerNode)initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4
{
  BWNoiseReducerNode *v6;
  uint64_t v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  BWNodeOutput *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWNoiseReducerNode;
  v6 = -[BWNode init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("ChromaNoiseReduction"));
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v9 = (NSDictionary *)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1), CFSTR("Synchronization"), 0);
    v10 = v9;
    if (v7)
      -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, CFSTR("ChromaNoiseReductionTuningParameters"));
    v6->_noiseReductionOptions = v10;
    v6->_cameraTuningOptions = (NSDictionary *)a3;
    v6->_contextSynchronization = 3;
    *(_WORD *)&v6->_threaded = 1;
    v6->_gpuPriority = 0;
    v6->_useInPlaceAlgorithm = !noiseReductionRequiresOutputSampleBuffer((const __CFDictionary *)a3);
    v11 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v6);
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", &unk_1E4A00B60);
    -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", v12);
    -[BWNodeInput setPassthroughMode:](v11, "setPassthroughMode:", v6->_useInPlaceAlgorithm);

    -[BWNode addInput:](v6, "addInput:", v11);
    v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
    -[BWNodeOutput setFormatRequirements:](v13, "setFormatRequirements:", -[BWNoiseReducerNode _outputRequirementsForInputFormat:]((uint64_t)v6, 0));
    -[BWNodeOutput setPassthroughMode:](v13, "setPassthroughMode:", v6->_useInPlaceAlgorithm);
    -[BWNode addOutput:](v6, "addOutput:", v13);

  }
  return v6;
}

- (BWVideoFormatRequirements)_outputRequirementsForInputFormat:(uint64_t)a1
{
  BWVideoFormatRequirements *v3;
  BWVideoFormatRequirements *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = objc_alloc_init(BWVideoFormatRequirements);
  v4 = v3;
  if (a2)
  {
    v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
    -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", objc_msgSend(a2, "width"));
    -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", objc_msgSend(a2, "height"));
  }
  else
  {
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00B78);
  }
  -[BWVideoFormatRequirements setSupportedCacheModes:](v4, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(a2, "colorSpaceProperties"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "colorSpaceProperties"));
    v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  }
  else
  {
    v5 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", v5);
  return v4;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  __CVBuffer *quadraResampledIntermediateBuffer;
  opaqueCMFormatDescription *quadraResampledIntermediaBufferFormatDescription;
  OpaqueVTPixelTransferSession *quadraResampledTransferSession;
  objc_super v7;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  noiseReductionReleaseBuffers((uint64_t)self->_context);
  noiseReductionContextDestroy(self->_context);
  quadraResampledIntermediateBuffer = self->_quadraResampledIntermediateBuffer;
  if (quadraResampledIntermediateBuffer)
    CFRelease(quadraResampledIntermediateBuffer);
  quadraResampledIntermediaBufferFormatDescription = self->_quadraResampledIntermediaBufferFormatDescription;
  if (quadraResampledIntermediaBufferFormatDescription)
    CFRelease(quadraResampledIntermediaBufferFormatDescription);
  quadraResampledTransferSession = self->_quadraResampledTransferSession;
  if (quadraResampledTransferSession)
    CFRelease(quadraResampledTransferSession);
  v7.receiver = self;
  v7.super_class = (Class)BWNoiseReducerNode;
  -[BWNode dealloc](&v7, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("NoiseReducer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", -[BWNoiseReducerNode _outputRequirementsForInputFormat:]((uint64_t)self, a3));
  if (self->_useInPlaceAlgorithm)
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  __assert_rtn("-[BWNoiseReducerNode prepareForCurrentConfigurationToBecomeLive]", "BWNoiseReducerNode.m", 155, "_quadraResampledTransferSession != NULL");
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v10;

  if (a4)
  {
    outputFormatDescription = self->_outputFormatDescription;
    if (outputFormatDescription)
    {
      CFRelease(outputFormatDescription);
      self->_outputFormatDescription = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWNoiseReducerNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v10, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v6;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
  {
    CFRelease(outputFormatDescription);
    self->_outputFormatDescription = 0;
  }
  noiseReductionReleaseBuffers((uint64_t)self->_context);
  noiseReductionContextDestroy(self->_context);
  self->_context = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWNoiseReducerNode;
  -[BWNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  NSDictionary *noiseReductionOptions;
  void *v8;
  void *v9;
  int v10;
  NSDictionary *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  CFTypeRef v18;
  CFTypeRef v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  __CVBuffer *v23;
  void *v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v29;
  __CVBuffer *quadraResampledIntermediateBuffer;
  uint64_t v31;
  id v32;
  const opaqueCMFormatDescription *FormatDescription;
  uint64_t Dimensions;
  const __CFDictionary *Attributes;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t height;
  size_t v40;
  const __CFAllocator *v41;
  const __CFString *key;
  void *v43;
  _BOOL4 v44;
  CFTypeRef cf;
  CMAttachmentBearerRef target;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  noiseReductionOptions = self->_noiseReductionOptions;
  cf = 0;
  target = 0;
  v8 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  v9 = v8;
  if (!v8)
  {
    fig_log_get_emitter();
    v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    v44 = 0;
    v21 = 0;
    v23 = 0;
    v15 = 0;
    v24 = 0;
    v25 = 4294954516;
LABEL_14:
    v26 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_28;
  }
  v10 = objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureType");
  if (!objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "noiseReductionEnabled"))
  {
    if (v10 == 8)
    {
      v23 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool"), "newPixelBuffer");
      target = -[BWNoiseReducerNode _newQuadraResampledSampleBufferFromSampleBuffer:outputPixelBuffer:]((CMSampleBufferRef)self, a3, v23);
      if (!target)
      {
        fig_log_get_emitter();
        v38 = v4;
        LODWORD(v37) = 0;
        FigDebugAssert3();
      }
      v44 = 0;
      v21 = 0;
      v15 = 0;
      v24 = 0;
      v25 = 0;
    }
    else
    {
      v44 = 0;
      v21 = 0;
      v23 = 0;
      v15 = 0;
      v24 = 0;
      v25 = 0;
      target = CFRetain(a3);
    }
    goto LABEL_14;
  }
  v11 = noiseReductionOptions;
  v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v43 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v13 = v43;
  v14 = (void *)CMGetAttachment(a3, CFSTR("NoiseReductionAlternateMetadata"), 0);
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    CMSetAttachment(a3, v12, v15, 1u);
  }
  key = v12;
  v17 = *MEMORY[0x1E0D08800];
  v18 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08800], 0);
  v44 = v18 != 0;
  if (v18)
  {
    v19 = v18;
    v20 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_noiseReductionOptions);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[NSDictionary objectForKeyedSubscript:](self->_noiseReductionOptions, "objectForKeyedSubscript:", CFSTR("ChromaNoiseReductionTuningParameters")));
    v22 = (void *)v19;
    noiseReductionOptions = v20;
    objc_msgSend(v22, "floatValue");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), v17);
    -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, CFSTR("ChromaNoiseReductionTuningParameters"));
  }
  else
  {
    v21 = 0;
    noiseReductionOptions = v11;
  }
  v24 = v43;
  if (self->_useInPlaceAlgorithm)
  {
    v25 = noiseReductionWithTuningOptions((uint64_t)self->_context, a3, self->_processLuma, self->_threaded, (const __CFDictionary *)noiseReductionOptions);
    v23 = 0;
    target = CFRetain(a3);
    goto LABEL_26;
  }
  v27 = (uint64_t)noiseReductionOptions;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v29 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool"), "newPixelBuffer");
  v23 = v29;
  if (!v29)
  {
    fig_log_get_emitter();
    v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    v25 = 4294954510;
    v26 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_34;
  }
  CMSetAttachment(v29, CFSTR("InputPixelBufferForAsyncNR"), ImageBuffer, 0);
  if (v10 != 8)
  {
    BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v23, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target);
    noiseReductionOptions = (NSDictionary *)v27;
    v25 = noiseReductionInOutWithTuningOptions((uint64_t)self->_context, a3, (opaqueCMSampleBuffer *)target, self->_processLuma, self->_threaded, v27);
    if (!(_DWORD)v25)
    {
LABEL_26:
      v26 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      if (!v15)
        goto LABEL_28;
      goto LABEL_27;
    }
    fig_log_get_emitter();
    v38 = v4;
    LODWORD(v37) = v25;
    goto LABEL_55;
  }
  quadraResampledIntermediateBuffer = self->_quadraResampledIntermediateBuffer;
  if (!quadraResampledIntermediateBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
    v40 = (int)Dimensions;
    v41 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    height = Dimensions >> 32;
    LODWORD(FormatDescription) = CMFormatDescriptionGetMediaSubType(FormatDescription);
    Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
    v36 = CVPixelBufferCreate(v41, v40, height, (OSType)FormatDescription, Attributes, &self->_quadraResampledIntermediateBuffer);
    if ((_DWORD)v36)
    {
      v25 = v36;
      v26 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      noiseReductionOptions = (NSDictionary *)v27;
      v24 = v43;
      goto LABEL_28;
    }
    quadraResampledIntermediateBuffer = self->_quadraResampledIntermediateBuffer;
    v24 = v43;
  }
  BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, quadraResampledIntermediateBuffer, (CFTypeRef *)&self->_quadraResampledIntermediaBufferFormatDescription, (CMSampleBufferRef *)&cf);
  noiseReductionOptions = (NSDictionary *)v27;
  v31 = noiseReductionInOutWithTuningOptions((uint64_t)self->_context, a3, (opaqueCMSampleBuffer *)cf, self->_processLuma, self->_threaded, v27);
  if ((_DWORD)v31)
  {
    v25 = v31;
    fig_log_get_emitter();
    v38 = v4;
    LODWORD(v37) = v25;
LABEL_55:
    FigDebugAssert3();
    goto LABEL_14;
  }
  target = -[BWNoiseReducerNode _newQuadraResampledSampleBufferFromSampleBuffer:outputPixelBuffer:]((CMSampleBufferRef)self, (CMSampleBufferRef)cf, v23);
  v26 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (target)
  {
    v25 = 0;
    if (v15)
LABEL_27:
      CMSetAttachment(target, key, v24, 1u);
  }
  else
  {
    fig_log_get_emitter();
    v38 = v4;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    v25 = 0;
  }
LABEL_28:
  if (target && (_DWORD)v25 != -12786 && (_DWORD)v25 != -12783)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:");
    if (!v44)
      goto LABEL_37;
    goto LABEL_35;
  }
  v27 = (uint64_t)noiseReductionOptions;
LABEL_34:
  v32 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v25, self, v9, v24, v37, v38);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v32);

  noiseReductionOptions = (NSDictionary *)v27;
  if (!v44)
    goto LABEL_37;
LABEL_35:
  if (noiseReductionOptions)
    CFRelease(noiseReductionOptions);
LABEL_37:
  if (v21)
    CFRelease(v21);

  if (v23)
    CFRelease(v23);
  if (target)
    CFRelease(target);
  if (cf)
    CFRelease(cf);
  if (*v26 == 1)
    kdebug_trace();
}

- (CMSampleBufferRef)_newQuadraResampledSampleBufferFromSampleBuffer:(__CVBuffer *)a3 outputPixelBuffer:
{
  uint64_t v3;
  __CVBuffer *ImageBuffer;
  CMSampleBufferRef v7;

  if (result)
  {
    v3 = (uint64_t)result;
    v7 = 0;
    if (*((_QWORD *)result + 20))
    {
      if (a3)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
        if (!VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v3 + 160), ImageBuffer, a3))
        {
          BWCMSampleBufferCreateCopyWithNewPixelBuffer(sbuf, a3, (CFTypeRef *)(v3 + 112), &v7);
          return v7;
        }
      }
      else
      {
        FigSignalErrorAt();
      }
    }
    return 0;
  }
  return result;
}

- (void)setQuadraHighResStillImageCaptureEnabled:(BOOL)a3
{
  self->_quadraHighResStillImageCaptureEnabled = a3;
}

- (BOOL)quadraHighResStillImageCaptureEnabled
{
  return self->_quadraHighResStillImageCaptureEnabled;
}

@end
