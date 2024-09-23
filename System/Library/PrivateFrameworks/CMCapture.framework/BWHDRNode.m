@implementation BWHDRNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWHDRNode)initWithClientPID:(int)a3 sensorIDDictionary:(id)a4
{
  return (BWHDRNode *)-[BWHDRNode _initWithClientPID:sensorIDDictionary:sbpCreationFunction:](self, "_initWithClientPID:sensorIDDictionary:sbpCreationFunction:", *(_QWORD *)&a3, a4, hdrn_createSampleBufferProcessor);
}

- (void)dealloc
{
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v4)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  OpaqueFigSampleBufferProcessor *v8;
  opaqueCMFormatDescription *telephotoHDREV0DisparityFormatDescription;
  OpaqueVTPixelTransferSession *telephotoHDREV0DisparityCopySession;
  objc_super v11;

  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    v4 = *(void (**)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 8);
    if (v4)
      v4(sampleBufferProcessor, 0, 0);
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    if (FigBaseObject)
    {
      v6 = FigBaseObject;
      v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v7)
        v7(v6);
    }
    v8 = self->_sampleBufferProcessor;
    if (v8)
    {
      CFRelease(v8);
      self->_sampleBufferProcessor = 0;
    }
  }
  -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);

  telephotoHDREV0DisparityFormatDescription = self->_telephotoHDREV0DisparityFormatDescription;
  if (telephotoHDREV0DisparityFormatDescription)
    CFRelease(telephotoHDREV0DisparityFormatDescription);
  telephotoHDREV0DisparityCopySession = self->_telephotoHDREV0DisparityCopySession;
  if (telephotoHDREV0DisparityCopySession)
    CFRelease(telephotoHDREV0DisparityCopySession);
  v11.receiver = self;
  v11.super_class = (Class)BWHDRNode;
  -[BWNode dealloc](&v11, sel_dealloc);
}

- (void)_clearCaptureRequestState
{
  uint64_t v2;
  const void *v3;

  if (a1)
  {

    *(_QWORD *)(a1 + 144) = 0;
    if (*(int *)(a1 + 128) >= 1)
    {
      v2 = 0;
      do
      {
        v3 = *(const void **)(a1 + 152 + 8 * v2);
        if (v3)
        {
          CFRelease(v3);
          *(_QWORD *)(a1 + 152 + 8 * v2) = 0;
        }
        ++v2;
      }
      while (v2 < *(int *)(a1 + 128));
    }
    *(_BYTE *)(a1 + 176) = 0;
    *(_BYTE *)(a1 + 177) = 0;

    *(_QWORD *)(a1 + 184) = 0;
    *(_DWORD *)(a1 + 192) = 0;
  }
}

- (id)_initWithClientPID:(int)a3 sensorIDDictionary:(id)a4 sbpCreationFunction:(void *)a5
{
  BWHDRNode *v8;
  BWHDRNode *v9;
  NSArray *v10;
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  BWNodeOutput *v13;
  BWVideoFormatRequirements *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BWHDRNode;
  v8 = -[BWNode init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_clientPID = a3;
    v8->_sensorIDDictionary = (NSDictionary *)a4;
    v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E4A02D60, &unk_1E4A02D70, &unk_1E4A02D80, 0);
    v9->_exposureValues = v10;
    v9->_bracketCount = -[NSArray count](v10, "count");
    v9->_createSampleBufferProcessorFunction = a5;
    v11 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v9);
    -[BWNodeInput setRetainedBufferCount:](v11, "setRetainedBufferCount:", -[NSArray count](v9->_exposureValues, "count"));
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", &unk_1E4A01748);
    -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", v12);

    -[BWNode addInput:](v9, "addInput:", v11);
    v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v9);
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", &unk_1E4A01760);
    -[BWNodeOutput setProvidesPixelBufferPool:](v13, "setProvidesPixelBufferPool:", 0);
    -[BWNodeOutput setFormatRequirements:](v13, "setFormatRequirements:", v14);

    -[BWNode addOutput:](v9, "addOutput:", v13);
  }
  return v9;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("HDRProcessor");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWVideoFormatRequirements *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", objc_msgSend(a3, "width"));
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", objc_msgSend(a3, "height"));
  -[BWVideoFormatRequirements setSupportedCacheModes:](v6, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(a3, "colorSpaceProperties"))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  }
  else
  {
    v7 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v6, "setSupportedColorSpaceProperties:", v7);
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", v6);

}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWHDRNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_sampleBufferProcessor && -[BWHDRNode _setupSampleBufferProcessor]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  if (self->_supportsStereoFusionCaptures && !self->_stereoFusionPixelConverter)
    self->_stereoFusionPixelConverter = objc_alloc_init(FigCapturePixelConverter);
}

- (uint64_t)_setupSampleBufferProcessor
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD, const __CFString *, uint64_t, uint64_t *);
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v1 = a1;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0;
    v2 = *(_QWORD *)(a1 + 112);
    if (v2)
    {
      v12 = *MEMORY[0x1E0D06170];
      v13[0] = v2;
      v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    }
    else
    {
      v3 = 0;
    }
    v4 = *(void (**)(_QWORD, const __CFString *, uint64_t, uint64_t *))(v1 + 96);
    if (!v4)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    v4(*MEMORY[0x1E0C9AE00], CFSTR("HDR"), v3, &v11);
    if (*(_DWORD *)(v1 + 104))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
      v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v7)
        v7(FigBaseObject, *MEMORY[0x1E0CC5E18], v5);
    }
    v8 = v11;
    *(_QWORD *)(v1 + 120) = v11;
    v9 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 8);
    if (!v9)
    {
      v1 = 4294954514;
LABEL_13:
      fig_log_get_emitter();
      FigDebugAssert3();
      return v1;
    }
    v1 = v9(v8, hdrn_processorOutputReadyCallback, v1);
    if ((_DWORD)v1)
      goto LABEL_13;
  }
  return v1;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  CFTypeRef v7;
  void *v8;
  const __CFString *v9;
  CFTypeRef v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  opaqueCMSampleBuffer **v16;
  const void *v17;
  int v18;
  opaqueCMSampleBuffer *v19;
  _BOOL4 v20;
  CGSize v21;
  uint64_t v22;
  opaqueCMSampleBuffer *v23;
  void *v24;
  double v25;
  BWPixelBufferPool *telephotoHDREV0DisparityBufferPool;
  uint64_t v27;
  __CVBuffer *v28;
  OpaqueVTPixelTransferSession *telephotoHDREV0DisparityCopySession;
  __CVBuffer *ImageBuffer;
  uint64_t v31;
  id v32;
  const opaqueCMFormatDescription *FormatDescription;
  CMVideoDimensions Dimensions;
  unsigned int v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  unsigned int v47;
  const char *v48;
  opaqueCMSampleBuffer *v49;
  CMAttachmentBearerRef v50;
  id v51;
  uint64_t bracketCount;
  int v53;
  opaqueCMSampleBuffer **pendingBracketBuffers;
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  CMSampleBufferRef v57;
  unsigned int (*v58)(OpaqueFigSampleBufferProcessor *, CMSampleBufferRef);
  CMSampleTimingInfo *sampleTimingArray;
  uint64_t v60;
  void *v61;
  void *v62;
  CMAttachmentBearerRef target;
  CGRect cf;
  CMSampleBufferRef v65;

  v65 = 0;
  if (!a3)
    return;
  if (!self->_sampleBufferProcessor)
    goto LABEL_77;
  v7 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!v7
    || (v8 = (void *)v7,
        v9 = (const __CFString *)*MEMORY[0x1E0D05CB0],
        (v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) == 0))
  {
LABEL_76:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_77;
  }
  v11 = (void *)v10;
  if (!self->_currentStillImageSettings)
  {
    if (objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureType") != 3)
    {
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
      return;
    }
    -[BWHDRNode _configureCaptureRequestStateWithStillImageCaptureSettings:]((uint64_t)self, v8);
  }
  v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
  v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
  v14 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (!v13)
  {
    v15 = v12 - 1;
    if (v12 < 1)
    {
LABEL_77:
      v18 = 0;
      goto LABEL_78;
    }
    v62 = (void *)v14;
    if (v12 > self->_bracketCount)
    {
      fig_log_get_emitter();
      v60 = v4;
      LODWORD(sampleTimingArray) = 0;
      FigDebugAssert3();
    }
    if (!self->_supportsStereoFusionCaptures)
    {
      v19 = self->_pendingBracketBuffers[v15];
      self->_pendingBracketBuffers[v15] = a3;
      CFRetain(a3);
      if (v19)
        CFRelease(v19);
      v20 = v12 == self->_bracketCount;
LABEL_33:
      v24 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06038], sampleTimingArray);
      if (v24)
      {
        objc_msgSend(v24, "doubleValue");
        if (v25 == 0.0
          && (-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureFlags") & 0x800) != 0&& objc_msgSend(v62, "isEqualToString:", *MEMORY[0x1E0D05A30]))
        {
          telephotoHDREV0DisparityBufferPool = self->_telephotoHDREV0DisparityBufferPool;
          if (!telephotoHDREV0DisparityBufferPool)
          {
            self->_telephotoHDREV0DisparityBufferPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", -[BWNodeOutput videoFormat](self->super._output, "videoFormat"), 1, CFSTR("HDR EV0 Disparity Pool"));
            VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_telephotoHDREV0DisparityCopySession);
            telephotoHDREV0DisparityBufferPool = self->_telephotoHDREV0DisparityBufferPool;
          }
          v27 = -[BWPixelBufferPool newPixelBuffer](telephotoHDREV0DisparityBufferPool, "newPixelBuffer");
          cf.origin.x = 0.0;
          if (v27)
          {
            v28 = (__CVBuffer *)v27;
            telephotoHDREV0DisparityCopySession = self->_telephotoHDREV0DisparityCopySession;
            ImageBuffer = CMSampleBufferGetImageBuffer(a3);
            v31 = VTPixelTransferSessionTransferImage(telephotoHDREV0DisparityCopySession, ImageBuffer, v28);
            if ((_DWORD)v31)
            {
              v32 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v31, self, self->_currentStillImageSettings, v11);
              -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v32);

            }
            else
            {
              BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v28, (CFTypeRef *)&self->_telephotoHDREV0DisparityFormatDescription, (CMSampleBufferRef *)&cf);
              -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", *(_QWORD *)&cf.origin.x);
            }
            CFRelease(v28);
            if (*(_QWORD *)&cf.origin.x)
              CFRelease(*(CFTypeRef *)&cf.origin.x);
          }
          else
          {
            v51 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954510, self, self->_currentStillImageSettings, v11);
            -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v51);

          }
        }
      }
      if (!v20)
        goto LABEL_77;
      bracketCount = self->_bracketCount;
      if ((int)bracketCount < 1)
      {
        v53 = 0;
      }
      else
      {
        v53 = 0;
        pendingBracketBuffers = self->_pendingBracketBuffers;
        do
        {
          if (!*pendingBracketBuffers++)
            ++v53;
          --bracketCount;
        }
        while (bracketCount);
      }
      if (self->_preBracketedFrameExpected && !self->_preBracketedFrameReceived)
      {
        if (!self->_supportsStereoFusionCaptures)
          goto LABEL_74;
        -[BWHDRNode _emitNodeErrorToReportFailedOutputFrame]((uint64_t)self);
        ++self->_emittedFrameOrErrorCount;
      }
      if (!v53)
      {
        if ((objc_msgSend((id)CMGetAttachment(self->_pendingBracketBuffers[1], CFSTR("StereoFusionFailed"), 0), "BOOLValue") & 1) != 0)
        {
          CMRemoveAttachment(self->_pendingBracketBuffers[1], CFSTR("StereoFusionFailed"));
          -[BWHDRNode _hdrProcessorOutputReady:sampleBuffer:]((uint64_t)self, -12780, 0);
          goto LABEL_75;
        }
        if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 0, 0, 0, 0, &v65))
        {
          CMSetAttachment(v65, (CFStringRef)*MEMORY[0x1E0D08518], self->_pendingBracketBuffers[2], 0);
          CMSetAttachment(v65, (CFStringRef)*MEMORY[0x1E0D08528], self->_pendingBracketBuffers[1], 0);
          CMSetAttachment(v65, (CFStringRef)*MEMORY[0x1E0D08520], self->_pendingBracketBuffers[0], 0);
          sampleBufferProcessor = self->_sampleBufferProcessor;
          v57 = v65;
          v58 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, CMSampleBufferRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
          if (v58)
          {
            if (!v58(sampleBufferProcessor, v57))
              goto LABEL_75;
          }
        }
      }
LABEL_74:
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_75:
      v18 = 1;
      goto LABEL_78;
    }
    if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureFlags") & 0x400) != 0)
    {
      v21 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      cf.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      cf.size = v21;
      if (objc_msgSend(v62, "isEqualToString:", *MEMORY[0x1E0D05A18]))
      {
        v22 = *MEMORY[0x1E0D05E68];
        if (FigCFDictionaryGetCGRectIfPresent())
          objc_msgSend(v11, "removeObjectForKey:", v22);
      }
      if (v12 != 2 && !CGRectIsNull(cf))
      {
        FormatDescription = CMSampleBufferGetFormatDescription(a3);
        Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
        -[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_stereoFusionPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", -[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "pixelFormat"), Dimensions, 2, -[BWVideoFormat colorSpaceProperties](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "colorSpaceProperties"), 1);
        target = 0;
        -[FigCapturePixelConverter convertSampleBuffer:cropRect:outputSampleBuffer:](self->_stereoFusionPixelConverter, "convertSampleBuffer:cropRect:outputSampleBuffer:", a3, &target, cf.origin.x * (double)Dimensions.width, cf.origin.y * (double)Dimensions.height, cf.size.width * (double)Dimensions.width, cf.size.height * (double)Dimensions.height);
        Dimensions.width = -[FigCaptureStillImageSettings outputWidth](-[BWStillImageSettings requestedSettings](self->_currentStillImageSettings, "requestedSettings"), "outputWidth");
        v35 = -[FigCaptureStillImageSettings outputHeight](-[BWStillImageSettings requestedSettings](self->_currentStillImageSettings, "requestedSettings"), "outputHeight");
        if (Dimensions.width && v35)
        {
          Dimensions = (CMVideoDimensions)Dimensions.width;
          v36 = v35;
        }
        else
        {
          Dimensions = -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->super._output, "videoFormat", sampleTimingArray, v60), "width");
          v36 = -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "height");
        }
        v61 = (void *)CMGetAttachment(target, v9, 0);
        v37 = -[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width");
        v38 = -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height");
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(v37, v38, cf.origin.x, cf.origin.y, cf.size.width, cf.size.height, (double)*(unint64_t *)&Dimensions / (double)v36);
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;
        LODWORD(v37) = -[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width");
        v47 = -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height");
        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v61, v37 | ((unint64_t)v47 << 32), Dimensions.width | ((unint64_t)v36 << 32), v40, v42, v44, v46, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
        FigCaptureMetadataUtilitiesPreventFurtherCropping(v61, v48);
        v49 = self->_pendingBracketBuffers[v15];
        v50 = target;
        self->_pendingBracketBuffers[v15] = (opaqueCMSampleBuffer *)target;
        if (v50)
          CFRetain(v50);
        if (v49)
          CFRelease(v49);
        if (target)
          CFRelease(target);
        goto LABEL_32;
      }
      v16 = self->_pendingBracketBuffers;
    }
    else
    {
      v16 = self->_pendingBracketBuffers;
    }
    v23 = v16[v15];
    v16[v15] = a3;
    CFRetain(a3);
    if (v23)
      CFRelease(v23);
LABEL_32:
    v20 = -[BWHDRNode _receivedExpectedNumberOfInputFramesOrErrors]((_BOOL8)self);
    goto LABEL_33;
  }
  if (self->_alwaysRequestsPreBracketedEV0)
  {
    if (!self->_preBracketedFrameExpected)
      goto LABEL_77;
    goto LABEL_20;
  }
  if (!self->_preBracketedFrameExpected)
    goto LABEL_76;
LABEL_20:
  self->_preBracketedFrameReceived = 1;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E49FB298, *MEMORY[0x1E0D06B08]);
  v17 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 1);
  CMSetAttachment(a3, CFSTR("StillImageProcessingFlags"), v17, 1u);
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  v18 = 0;
  ++self->_emittedFrameOrErrorCount;
LABEL_78:
  if (v65)
  {
    CFRelease(v65);
    if ((v18 & 1) == 0)
      return;
  }
  else if (!v18)
  {
    return;
  }
  if (self->_supportsStereoFusionCaptures)
    -[BWHDRNode _emitNodeErrorsIfNecessary]((uint64_t)self);
  -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);
}

- (uint64_t)_configureCaptureRequestStateWithStillImageCaptureSettings:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    *(_QWORD *)(result + 144) = a2;
    result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverOriginalImage");
    *(_BYTE *)(v3 + 176) = result;
  }
  return result;
}

- (BOOL)_receivedExpectedNumberOfInputFramesOrErrors
{
  uint64_t v1;
  int v2;
  _QWORD *v3;
  int v5;

  if (result)
  {
    v1 = *(unsigned int *)(result + 128);
    if ((int)v1 < 1)
    {
      v2 = 0;
    }
    else
    {
      v2 = 0;
      v3 = (_QWORD *)(result + 152);
      do
      {
        if (*v3++)
          ++v2;
        --v1;
      }
      while (v1);
    }
    v5 = v2 + *(unsigned __int8 *)(result + 177);
    return v5 + objc_msgSend(*(id *)(result + 184), "count") >= *(_DWORD *)(result + 128)
                                                                            + *(unsigned __int8 *)(result + 176);
  }
  return result;
}

- (void)_emitNodeErrorToReportFailedOutputFrame
{
  id v2;

  if (a1)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 184), "count") < 2)
    {
      v2 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, a1, *(_QWORD *)(a1 + 144), 0);
    }
    else
    {
      v2 = (id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndex:", 0);
      objc_msgSend(*(id *)(a1 + 184), "removeObjectAtIndex:", 0);
    }
    objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v2);

  }
}

- (void)_hdrProcessorOutputReady:(CMAttachmentBearerRef)target sampleBuffer:
{
  uint64_t v3;
  CFTypeRef v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  id v12;
  uint64_t v13;

  if (a1)
  {
    v6 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08518], 0);
    if (a2)
    {
      v7 = *(const void **)(a1 + 160);
    }
    else
    {
      v7 = v6;
      if (!v6)
      {
        fig_log_get_emitter();
        LODWORD(v13) = 0;
        FigDebugAssert3();
        v12 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954510, a1, *(_QWORD *)(a1 + 144), 0, v13, v3);
        objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v12);

        goto LABEL_10;
      }
      v8 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 144), "requestedSettings"), "providesOriginalImage"))
        v9 = 3;
      else
        v9 = 2;
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v9);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D06B08]);
      v11 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v7, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 2);
      CMSetAttachment(v7, CFSTR("StillImageProcessingFlags"), v11, 1u);
      CMSetAttachment(v7, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);
      CMRemoveAttachment(v7, (CFStringRef)*MEMORY[0x1E0D05D20]);
    }
    objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v7);
LABEL_10:
    ++*(_DWORD *)(a1 + 192);
  }
}

- (void)_emitNodeErrorsIfNecessary
{
  unsigned int v2;
  int v3;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 176) + 1 - *(_DWORD *)(a1 + 192);
    if (v2)
    {
      if (v2 <= 1)
        v3 = 1;
      else
        v3 = *(unsigned __int8 *)(a1 + 176) + 1 - *(_DWORD *)(a1 + 192);
      do
      {
        -[BWHDRNode _emitNodeErrorToReportFailedOutputFrame](a1);
        --v3;
      }
      while (v3);
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  _BOOL4 supportsStereoFusionCaptures;
  BWStillImageSettings *currentStillImageSettings;
  NSMutableArray *receivedNodeErrors;
  uint64_t v9;

  supportsStereoFusionCaptures = self->_supportsStereoFusionCaptures;
  currentStillImageSettings = self->_currentStillImageSettings;
  if (supportsStereoFusionCaptures)
  {
    if (!currentStillImageSettings)
      -[BWHDRNode _configureCaptureRequestStateWithStillImageCaptureSettings:]((uint64_t)self, (void *)objc_msgSend(a3, "stillImageSettings", a3, a4));
    receivedNodeErrors = self->_receivedNodeErrors;
    if (!receivedNodeErrors)
    {
      receivedNodeErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_receivedNodeErrors = receivedNodeErrors;
    }
    -[NSMutableArray addObject:](receivedNodeErrors, "addObject:", a3, a4);
    if (-[BWHDRNode _receivedExpectedNumberOfInputFramesOrErrors]((_BOOL8)self))
    {
      -[BWHDRNode _emitNodeErrorsIfNecessary]((uint64_t)self);
      -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);
    }
  }
  else
  {
    if (currentStillImageSettings)
    {
      v9 = -[BWStillImageSettings requestedSettings](currentStillImageSettings, "requestedSettings", a3, a4);
      if (v9 == objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"))
        -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);
    }
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3, a4);
  }
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (void)setAlwaysRequestsPreBracketedEV0:(BOOL)a3
{
  self->_alwaysRequestsPreBracketedEV0 = a3;
}

- (BOOL)alwaysRequestsPreBracketedEV0
{
  return self->_alwaysRequestsPreBracketedEV0;
}

- (void)setSupportsStereoFusionCaptures:(BOOL)a3
{
  self->_supportsStereoFusionCaptures = a3;
}

- (BOOL)supportsStereoFusionCaptures
{
  return self->_supportsStereoFusionCaptures;
}

@end
