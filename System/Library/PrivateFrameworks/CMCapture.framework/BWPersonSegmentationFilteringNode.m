@implementation BWPersonSegmentationFilteringNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  id v9;
  BWVideoFormatRequirements *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int inputOrientationRelativeToSensor;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else if (objc_msgSend(a5, "isEqualToString:", 0x1E495AF78))
  {
    v9 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->super._output, "mediaConfigurationForAttachedMediaKey:", a5);
    v10 = objc_alloc_init(BWVideoFormatRequirements);
    v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v10, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1));
    v11 = objc_msgSend(a3, "width");
    v12 = objc_msgSend(a3, "height");
    if (self->_alignsMaskWithPrimaryCaptureRect)
    {
      v13 = -[BWVideoFormat width](-[BWNodeOutputMediaProperties resolvedVideoFormat](-[BWNodeOutput primaryMediaProperties](self->super._output, "primaryMediaProperties"), "resolvedVideoFormat"), "width");
      v14 = -[BWVideoFormat height](-[BWNodeOutputMediaProperties resolvedVideoFormat](-[BWNodeOutput primaryMediaProperties](self->super._output, "primaryMediaProperties"), "resolvedVideoFormat"), "height");
      inputOrientationRelativeToSensor = self->_inputOrientationRelativeToSensor;
      if (inputOrientationRelativeToSensor == 270)
        v16 = v14;
      else
        v16 = v13;
      if (inputOrientationRelativeToSensor == 270)
        v17 = v13;
      else
        v17 = v14;
      v18 = inputOrientationRelativeToSensor == 90;
      if (inputOrientationRelativeToSensor == 90)
        v19 = v14;
      else
        v19 = v16;
      if (v18)
        v20 = v13;
      else
        v20 = v17;
      v11 = vcvtas_u32_f32((float)((float)v12 * (float)v19) / (float)v20);
    }
    -[BWVideoFormatRequirements setWidth:](v10, "setWidth:", v11);
    -[BWVideoFormatRequirements setHeight:](v10, "setHeight:", v12);
    objc_msgSend(v9, "setFormatRequirements:", v10);
  }
  else if ((objc_msgSend(a5, "isEqualToString:", 0x1E4951418) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E49513F8) & 1) == 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)BWPersonSegmentationFilteringNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v21, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  _BOOL4 IsMarkerBuffer;
  _DWORD *v7;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef ImageBuffer;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *v11;
  CVImageBufferRef v12;
  CVImageBufferRef v13;
  void *AttachedInferenceResult;
  int v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  int v19;
  CFTypeRef v20;
  __CVBuffer *v21;
  const __CFDictionary *v27;
  double x;
  double width;
  unsigned int inputOrientationRelativeToSensor;
  double height;
  double y;
  const __CFDictionary *v34;
  double v35;
  double v36;
  unsigned int v37;
  double v38;
  double v39;
  opaqueCMSampleBuffer *v40;
  int CopyWithNewPixelBuffer;
  opaqueCMSampleBuffer **p_cachedFilteredMaskSampleBuffer;
  opaqueCMSampleBuffer *cachedFilteredMaskSampleBuffer;
  opaqueCMSampleBuffer *v44;
  opaqueCMSampleBuffer **v45;
  opaqueCMSampleBuffer *cf;
  CMTime v47;
  CFTypeRef v48;
  CGRect time;
  CMTime v50;

  IsMarkerBuffer = BWSampleBufferIsMarkerBuffer(a3);
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (IsMarkerBuffer)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    goto LABEL_85;
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    CMSampleBufferGetPresentationTimeStamp(&v50, a3);
    time.origin = *(CGPoint *)&v50.value;
    *(_QWORD *)&time.size.width = v50.epoch;
    CMTimeGetSeconds((CMTime *)&time);
    kdebug_trace();
  }
  -[FigSemanticStyleFilteringV1 finishProcessing](self->_segmentationMaskFilter, "finishProcessing");
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E49513F8);
  if (AttachedMedia)
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  else
    ImageBuffer = 0;
  v10 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495AF78);
  v11 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E4951418);
  if (v11)
  {
    v12 = CMSampleBufferGetImageBuffer(v11);
    if (v10)
    {
LABEL_10:
      v13 = CMSampleBufferGetImageBuffer(v10);
      goto LABEL_13;
    }
  }
  else
  {
    v12 = 0;
    if (v10)
      goto LABEL_10;
  }
  v13 = 0;
LABEL_13:
  cf = a3;
  AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(a3, 105);
  v15 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "preventionReason"), "isEqualToString:", 0x1E4950F78);
  v16 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "preventionReason"), "isEqualToString:", 0x1E4950FF8);
  if (AttachedInferenceResult)
    v17 = objc_msgSend(AttachedInferenceResult, "preventionReason") == 0;
  else
    v17 = 0;
  if (self->_inferencePreviouslyAttached)
  {
    v18 = 1;
  }
  else
  {
    v18 = AttachedInferenceResult != 0;
    self->_inferencePreviouslyAttached = v18;
  }
  if (v18)
    v19 = v15;
  else
    v19 = 1;
  if (((v19 | v16 | v17) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v20 = 0;
    goto LABEL_90;
  }
  v20 = CFRetain(cf);
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_90:
    v21 = 0;
    v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_81:
    CMSampleBufferGetPresentationTimeStamp(&v47, cf);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F018, &v47));
    if (!v20)
      goto LABEL_83;
    goto LABEL_82;
  }
  if (v17)
  {
    if (!v13 || !ImageBuffer || !self->_segmentationMaskFilter || !v12)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v21 = 0;
      goto LABEL_95;
    }
    v21 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1E495AF78), "livePixelBufferPool"), "newPixelBuffer");
    if (v21)
    {
      time.origin.x = 0.0;
      time.origin.y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      time.size = _Q0;
      if (self->_alignsMaskWithPrimaryCaptureRect)
      {
        v27 = (const __CFDictionary *)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
        if (v27)
          CGRectMakeWithDictionaryRepresentation(v27, &time);
      }
      -[FigSemanticStyleFilteringV1 setOpticalFlowDisplacementPixelBuffer:](self->_segmentationMaskFilter, "setOpticalFlowDisplacementPixelBuffer:", v12);
      -[FigSemanticStyleFilteringV1 setInputImagePixelBuffer:](self->_segmentationMaskFilter, "setInputImagePixelBuffer:", ImageBuffer);
      -[FigSemanticStyleFilteringV1 setInputMaskPixelBuffer:](self->_segmentationMaskFilter, "setInputMaskPixelBuffer:", v13);
      x = 0.0;
      width = 1.0;
      if (self->_alignsMaskWithPrimaryCaptureRect)
      {
        inputOrientationRelativeToSensor = self->_inputOrientationRelativeToSensor;
        if (inputOrientationRelativeToSensor == 270)
        {
          x = time.origin.x;
          y = time.origin.y;
          width = time.size.width;
          height = time.size.height;
        }
        else
        {
          height = 1.0;
          y = 0.0;
          if (inputOrientationRelativeToSensor == 90)
          {
            x = time.origin.x;
            width = time.size.width;
            height = time.size.height;
            y = 1.0 - (time.origin.y + time.size.height);
          }
        }
      }
      else
      {
        height = 1.0;
        y = 0.0;
      }
      -[FigSemanticStyleFilteringV1 setDestinationRectangleInOutputMaskPixelBuffer:](self->_segmentationMaskFilter, "setDestinationRectangleInOutputMaskPixelBuffer:", y, x, height, width);
      -[FigSemanticStyleFilteringV1 setOutputMaskPixelBuffer:](self->_segmentationMaskFilter, "setOutputMaskPixelBuffer:", v21);
      if (!-[FigSemanticStyleFilteringV1 process](self->_segmentationMaskFilter, "process"))
      {
        v48 = 0;
        CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v10, v21, (CFTypeRef *)&self->_filteredMaskFormatDescription, (CMSampleBufferRef *)&v48);
        v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        if (!v48)
          goto LABEL_96;
        CMSetAttachment(v48, CFSTR("PersonSegmentationMaskToMainImageRotationDegrees"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_inputOrientationRelativeToSensor), 1u);
        BWSampleBufferSetAttachedMedia(v20, 0x1E495AF78, (uint64_t)v48);
        if (v48)
          CFRelease(v48);
        p_cachedFilteredMaskSampleBuffer = &self->_cachedFilteredMaskSampleBuffer;
        cachedFilteredMaskSampleBuffer = self->_cachedFilteredMaskSampleBuffer;
        if (cachedFilteredMaskSampleBuffer)
        {
          CFRelease(cachedFilteredMaskSampleBuffer);
          *p_cachedFilteredMaskSampleBuffer = 0;
        }
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v48, &self->_cachedFilteredMaskSampleBuffer);
        if (!*p_cachedFilteredMaskSampleBuffer)
        {
LABEL_96:
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_80;
        }
LABEL_79:
        BWSampleBufferRemoveAttachedMedia(v20, 0x1E4951418);
        BWSampleBufferRemoveAttachedMedia(v20, 0x1E49513F8);
        -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v20);
        goto LABEL_80;
      }
      goto LABEL_95;
    }
    goto LABEL_94;
  }
  if (!v15)
  {
    if (v16)
    {
      v40 = self->_cachedFilteredMaskSampleBuffer;
      v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      if (v40)
      {
        CFRelease(v40);
        v21 = 0;
        CopyWithNewPixelBuffer = 0;
        self->_cachedFilteredMaskSampleBuffer = 0;
      }
      else
      {
        v21 = 0;
        CopyWithNewPixelBuffer = 0;
      }
    }
    else
    {
      v21 = 0;
      CopyWithNewPixelBuffer = 0;
      v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    goto LABEL_79;
  }
  if (self->_frameRateUpsamplingEnabled)
  {
    v21 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1E495AF78), "livePixelBufferPool"), "newPixelBuffer");
    if (v21 && v12)
    {
      time.origin.x = 0.0;
      time.origin.y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      time.size = _Q0;
      if (self->_alignsMaskWithPrimaryCaptureRect)
      {
        v34 = (const __CFDictionary *)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
        if (v34)
          CGRectMakeWithDictionaryRepresentation(v34, &time);
      }
      -[FigSemanticStyleFilteringV1 setInputImagePixelBuffer:](self->_segmentationMaskFilter, "setInputImagePixelBuffer:", CMSampleBufferGetImageBuffer(cf));
      if (-[FigSemanticStyleFilteringV1 inputImagePixelBuffer](self->_segmentationMaskFilter, "inputImagePixelBuffer"))
      {
        -[FigSemanticStyleFilteringV1 setInputMaskPixelBuffer:](self->_segmentationMaskFilter, "setInputMaskPixelBuffer:", 0);
        -[FigSemanticStyleFilteringV1 setInputImageCropRectangle:](self->_segmentationMaskFilter, "setInputImageCropRectangle:", time.origin.x, time.origin.y, time.size.width, time.size.height);
        -[FigSemanticStyleFilteringV1 setRotationDegreesToApplyToInputImage:](self->_segmentationMaskFilter, "setRotationDegreesToApplyToInputImage:", -self->_inputOrientationRelativeToSensor);
        v35 = 1.0;
        v36 = 0.0;
        if (self->_alignsMaskWithPrimaryCaptureRect)
        {
          v37 = self->_inputOrientationRelativeToSensor;
          if (v37 == 270)
          {
            v38 = time.origin.x;
            v36 = time.origin.y;
            v39 = time.size.width;
            v35 = time.size.height;
          }
          else
          {
            v38 = 0.0;
            v39 = 1.0;
            if (v37 == 90)
            {
              v38 = time.origin.x;
              v39 = time.size.width;
              v35 = time.size.height;
              v36 = 1.0 - (time.origin.y + time.size.height);
            }
          }
        }
        else
        {
          v38 = 0.0;
          v39 = 1.0;
        }
        -[FigSemanticStyleFilteringV1 setDestinationRectangleInOutputMaskPixelBuffer:](self->_segmentationMaskFilter, "setDestinationRectangleInOutputMaskPixelBuffer:", v36, v38, v35, v39);
        -[FigSemanticStyleFilteringV1 setOutputMaskPixelBuffer:](self->_segmentationMaskFilter, "setOutputMaskPixelBuffer:", v21);
        -[FigSemanticStyleFilteringV1 setOpticalFlowDisplacementPixelBuffer:](self->_segmentationMaskFilter, "setOpticalFlowDisplacementPixelBuffer:", v12);
        if (!-[FigSemanticStyleFilteringV1 process](self->_segmentationMaskFilter, "process"))
        {
          v48 = 0;
          v45 = &self->_cachedFilteredMaskSampleBuffer;
          CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(self->_cachedFilteredMaskSampleBuffer, v21, (CFTypeRef *)&self->_filteredMaskFormatDescription, (CMSampleBufferRef *)&v48);
          v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
          if (!v48)
            goto LABEL_96;
          CMSetAttachment(v48, CFSTR("PersonSegmentationMaskToMainImageRotationDegrees"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_inputOrientationRelativeToSensor), 1u);
          BWSampleBufferSetAttachedMedia(v20, 0x1E495AF78, (uint64_t)v48);
          if (v48)
            CFRelease(v48);
          if (*v45)
          {
            CFRelease(*v45);
            *v45 = 0;
          }
          BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v48, &self->_cachedFilteredMaskSampleBuffer);
          if (!*v45)
            goto LABEL_96;
          goto LABEL_79;
        }
LABEL_95:
        CopyWithNewPixelBuffer = 0;
        v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        goto LABEL_80;
      }
    }
LABEL_94:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_95;
  }
  v44 = self->_cachedFilteredMaskSampleBuffer;
  if (!v44)
  {
    v21 = 0;
    CopyWithNewPixelBuffer = 0;
    v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_79;
  }
  time.origin.x = 0.0;
  BWCMSampleBufferCreateCopyIncludingMetadata(v44, (CMSampleBufferRef *)&time);
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*(_QWORD *)&time.origin.x)
  {
    BWSampleBufferSetAttachedMedia(v20, 0x1E495AF78, *(uint64_t *)&time.origin.x);
    if (*(_QWORD *)&time.origin.x)
      CFRelease(*(CFTypeRef *)&time.origin.x);
    v21 = 0;
    CopyWithNewPixelBuffer = 0;
    goto LABEL_79;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v21 = 0;
  CopyWithNewPixelBuffer = 0;
LABEL_80:
  if (CopyWithNewPixelBuffer)
    goto LABEL_81;
LABEL_82:
  CFRelease(v20);
LABEL_83:
  if (v21)
    CFRelease(v21);
LABEL_85:
  if (*v7 == 1)
    kdebug_trace();
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  -[BWPersonSegmentationFilteringNode _loadAndConfigureSegmentationMaskFilter]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWPersonSegmentationFilteringNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (uint64_t)_loadAndConfigureSegmentationMaskFilter
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (result)
  {
    v1 = result;
    v12 = 0;
    if (*(_QWORD *)(result + 112))
      return 0;
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors"), CFSTR("SemanticStyle"), 1, v12);
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v2);
    if (v3)
    {
      v4 = v3;
      if (!objc_msgSend(v3, "loadAndReturnError:", &v12))
        return 4294954510;
      v5 = objc_msgSend(v4, "classNamed:", CFSTR("FigSemanticStyleFilteringV1"));
      if (v5)
      {
        v6 = (objc_class *)v5;
        v7 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
        if (v7)
        {
          v8 = *(id *)(v1 + 136);
          if (v8 || (v8 = (id)objc_msgSend(v7, "newCommandQueue")) != 0)
          {
            v9 = *(_DWORD *)(v1 + 96);
            if (v9)
            {
              if (v9 != 1)
              {
LABEL_14:
                v11 = (void *)objc_msgSend([v6 alloc], "initWithCommandQueue:", v8);
                *(_QWORD *)(v1 + 112) = v11;
                objc_msgSend(v11, "setMaskInterpolationEnabled:", *(unsigned __int8 *)(v1 + 100));
                objc_msgSend(*(id *)(v1 + 112), "prepareToProcess:", 0);
                return 0;
              }
              v10 = 1;
            }
            else
            {
              v10 = 4;
            }
            objc_msgSend(v8, "setGPUPriority:", v10);
            goto LABEL_14;
          }
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (void)setInputOrientationRelativeToSensor:(unsigned int)a3
{
  self->_inputOrientationRelativeToSensor = a3;
}

- (void)setAlignsMaskWithPrimaryCaptureRect:(BOOL)a3
{
  self->_alignsMaskWithPrimaryCaptureRect = a3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWPersonSegmentationFilteringNode)initWithGPUPriority:(int)a3 frameRateUpsamplingEnabled:(BOOL)a4 metalCommandQueue:(id)a5
{
  BWPersonSegmentationFilteringNode *v8;
  BWPersonSegmentationFilteringNode *v9;
  BWVideoFormatRequirements *v10;
  BWNodeInput *v11;
  BWNodeInputMediaConfiguration *v12;
  BWNodeInputMediaConfiguration *v13;
  BWNodeInputMediaConfiguration *v14;
  BWNodeInputMediaConfiguration *v15;
  BWNodeOutput *v16;
  BWNodeOutputMediaConfiguration *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BWPersonSegmentationFilteringNode;
  v8 = -[BWNode init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_gpuPriority = a3;
    v8->_frameRateUpsamplingEnabled = a4;
    v8->_commandQueue = (MTLCommandQueue *)a5;
    v10 = objc_alloc_init(BWVideoFormatRequirements);
    v11 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v9);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setFormatRequirements:", v10);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setDelayedBufferCount:", 1);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
    v12 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v12, "setFormatRequirements:", v10);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v12, "setDelayedBufferCount:", 1);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v12, "setPassthroughMode:", 0);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11, "setMediaConfiguration:forAttachedMediaKey:", v12, 0x1E495AF78);
    v13 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v13, "setFormatRequirements:", v10);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v13, "setDelayedBufferCount:", 1);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", 1);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11, "setMediaConfiguration:forAttachedMediaKey:", v13, 0x1E495AFB8);
    v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", v10);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v14, "setDelayedBufferCount:", 1);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v14, "setPassthroughMode:", 0);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11, "setMediaConfiguration:forAttachedMediaKey:", v14, 0x1E4951418);
    v15 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v15, "setFormatRequirements:", v10);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v15, "setDelayedBufferCount:", 1);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v15, "setPassthroughMode:", 0);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11, "setMediaConfiguration:forAttachedMediaKey:", v15, 0x1E49513F8);
    -[BWNode addInput:](v9, "addInput:", v11);

    v16 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v9);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v16, "primaryMediaConfiguration"), "setFormatRequirements:", v10);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v16, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
    v17 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", v10);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v17, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v16, "setMediaConfiguration:forAttachedMediaKey:", v17, 0x1E495AF78);
    -[BWNode addOutput:](v9, "addOutput:", v16);

  }
  return v9;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *cachedFilteredMaskSampleBuffer;
  opaqueCMFormatDescription *filteredMaskFormatDescription;
  objc_super v5;

  cachedFilteredMaskSampleBuffer = self->_cachedFilteredMaskSampleBuffer;
  if (cachedFilteredMaskSampleBuffer)
  {
    CFRelease(cachedFilteredMaskSampleBuffer);
    self->_cachedFilteredMaskSampleBuffer = 0;
  }
  filteredMaskFormatDescription = self->_filteredMaskFormatDescription;
  if (filteredMaskFormatDescription)
    CFRelease(filteredMaskFormatDescription);

  v5.receiver = self;
  v5.super_class = (Class)BWPersonSegmentationFilteringNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("PersonSegmentationFiltering");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  opaqueCMSampleBuffer *cachedFilteredMaskSampleBuffer;
  objc_super v6;

  -[FigSemanticStyleFilteringV1 purgeResources](self->_segmentationMaskFilter, "purgeResources");

  self->_segmentationMaskFilter = 0;
  cachedFilteredMaskSampleBuffer = self->_cachedFilteredMaskSampleBuffer;
  if (cachedFilteredMaskSampleBuffer)
  {
    CFRelease(cachedFilteredMaskSampleBuffer);
    self->_cachedFilteredMaskSampleBuffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BWPersonSegmentationFilteringNode;
  -[BWNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

- (unsigned)inputOrientationRelativeToSensor
{
  return self->_inputOrientationRelativeToSensor;
}

- (BOOL)alignsMaskWithPrimaryCaptureRect
{
  return self->_alignsMaskWithPrimaryCaptureRect;
}

@end
