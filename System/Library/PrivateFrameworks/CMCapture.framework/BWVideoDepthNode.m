@implementation BWVideoDepthNode

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  uint64_t v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Depth"), a4))
    return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "preparedPixelBufferPool");
  if (objc_msgSend(a3, "isEqualToString:", 0x1E4951598))
  {
    v7 = 256;
    return *(Class *)((char *)&self->super.super.isa + v7);
  }
  if (objc_msgSend(a3, "isEqualToString:", 0x1E49515F8))
  {
    v7 = 264;
    return *(Class *)((char *)&self->super.super.isa + v7);
  }
  return 0;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWInferenceVideoFormatRequirements *v9;
  id v10;
  BWInferenceVideoFormatRequirements *v11;
  uint64_t v12;
  BWInferenceVideoFormat *v13;
  objc_super v14;
  BWInferenceVideoFormatRequirements *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else if ((objc_msgSend(a5, "isEqualToString:", 0x1E49515B8) & 1) != 0
         || objc_msgSend(a5, "isEqualToString:", 0x1E4951418))
  {
    v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(a3, "pixelBufferAttributes"));
    -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v9, "setIncludesInvalidContent:", 0);
    v16[0] = v9;
    v10 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
    -[BWInferenceEngine prepareForInputInferenceVideoFormat:attachedMediaKey:](self->_inferenceEngine, "prepareForInputInferenceVideoFormat:attachedMediaKey:", v10, a5);
    if (objc_msgSend(a5, "isEqualToString:", 0x1E49515B8))
      self->_primaryMediaInputFormat = (BWInferenceVideoFormat *)v10;
  }
  else if (objc_msgSend(a5, "isEqualToString:", CFSTR("Depth")))
  {
    objc_msgSend(a3, "width");
    objc_msgSend(a3, "height");
    self->_blankDisparityPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
    v11 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v11, "setWidth:", objc_msgSend(a3, "width"));
    -[BWVideoFormatRequirements setHeight:](v11, "setHeight:", objc_msgSend(a3, "height"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", &unk_1E4A01028);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v11, "setBytesPerRowAlignment:", 64);
    if (self->_sourceIsNuri)
      v12 = 0;
    else
      v12 = -[BWFigVideoCaptureDevice depthDataBaseRotation](self->_captureDevice, "depthDataBaseRotation");
    -[BWInferenceVideoFormatRequirements setRotationDegrees:](v11, "setRotationDegrees:", v12);
    v15 = v11;
    v13 = (BWInferenceVideoFormat *)+[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1));
    self->_disparityInputFormat = v13;
    -[BWInferenceEngine prepareForInputInferenceVideoFormat:attachedMediaKey:](self->_inferenceEngine, "prepareForInputInferenceVideoFormat:attachedMediaKey:", v13, 0x1E4951458);
  }
  v14.receiver = self;
  v14.super_class = (Class)BWVideoDepthNode;
  -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v14, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", 0x1E49515B8);
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  int *v5;

  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951458) & 1) != 0)
  {
    v5 = &OBJC_IVAR___BWVideoDepthNode__disparityInputFormat;
    return *(Class *)((char *)&self->super.super.isa + *v5);
  }
  if (objc_msgSend(a3, "isEqualToString:", 0x1E49515B8))
  {
    v5 = &OBJC_IVAR___BWVideoDepthNode__primaryMediaInputFormat;
    return *(Class *)((char *)&self->super.super.isa + *v5);
  }
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  uint64_t v5;

  if (objc_msgSend(a3, "isEqualToString:", 0x1E4951498))
  {
    v5 = 248;
    return *(Class *)((char *)&self->super.super.isa + v5);
  }
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951518) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", 0x1E4951538))
  {
    v5 = 240;
    return *(Class *)((char *)&self->super.super.isa + v5);
  }
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E49515F8) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", 0x1E49515D8))
  {
    v5 = 232;
    return *(Class *)((char *)&self->super.super.isa + v5);
  }
  return (id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  const void *AttachedMedia;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  opaqueCMSampleBuffer *previousDisparitySampleBuffer;
  opaqueCMSampleBuffer *previousFeaturesSampleBuffer;
  const void *PixelBuffer;
  opaqueCMSampleBuffer *disparityPostprocessingInStateSampleBuffer;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __CVBuffer *blankDisparityPixelBuffer;
  int v28;
  int v29;
  os_unfair_lock_s *v30;
  os_unfair_lock_s *v31;
  opaqueCMSampleBuffer *v32;
  opaqueCMSampleBuffer *v33;
  opaqueCMSampleBuffer *v34;
  __CVBuffer *ImageBuffer;
  const __CFString *v36;
  void *v37;
  void *v38;
  opaqueCMSampleBuffer *v39;
  opaqueCMSampleBuffer *v40;
  opaqueCMSampleBuffer *v41;
  id v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  CMTime v46;
  CFTypeRef cf;
  CMTime v48;
  CMAttachmentBearerRef target;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  target = 0;
  memset(&v48, 0, sizeof(v48));
  CMSampleBufferGetPresentationTimeStamp(&v48, a3);
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  cf = AttachedMedia;
  if (AttachedMedia)
    CFRetain(AttachedMedia);
  BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  v8 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D086E0], 0), "intValue");
  if (self->_structuredLightIsOccluded)
  {
    v15 = v8 == 1 || cf == 0;
    v16 = v15;
    self->_structuredLightIsOccluded = v16;
    if (!v15)
    {
      previousDisparitySampleBuffer = self->_previousDisparitySampleBuffer;
      if (previousDisparitySampleBuffer)
        CFRelease(previousDisparitySampleBuffer);
      self->_previousDisparitySampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      previousFeaturesSampleBuffer = self->_previousFeaturesSampleBuffer;
      if (previousFeaturesSampleBuffer)
        CFRelease(previousFeaturesSampleBuffer);
      self->_previousFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      -[BWVideoFormat width](self->_disparityStateVideoFormat, "width");
      -[BWVideoFormat height](self->_disparityStateVideoFormat, "height");
      -[BWVideoFormat pixelFormat](self->_disparityStateVideoFormat, "pixelFormat");
      PixelBuffer = (const void *)CreatePixelBuffer();
      disparityPostprocessingInStateSampleBuffer = self->_disparityPostprocessingInStateSampleBuffer;
      if (disparityPostprocessingInStateSampleBuffer)
        CFRelease(disparityPostprocessingInStateSampleBuffer);
      self->_disparityPostprocessingInStateSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      if (PixelBuffer)
        CFRelease(PixelBuffer);
      LODWORD(v21) = 0;
      LODWORD(v22) = 0;
      LODWORD(v23) = 0;
      LODWORD(v24) = 0;
      LODWORD(v25) = 0;
      LODWORD(v26) = 0;
      -[BWFigVideoCaptureDevice updateSDOFBackgroundShiftSum:invalidShiftRatio:closeCanonicalDisparityAverage:faceCanonicalDisparityAverages:erodedForegroundRatio:foregroundRatio:occluded:faces:personSegmentationRatio:](self->_captureDevice, "updateSDOFBackgroundShiftSum:invalidShiftRatio:closeCanonicalDisparityAverage:faceCanonicalDisparityAverages:erodedForegroundRatio:foregroundRatio:occluded:faces:personSegmentationRatio:", 0, 0, 0, v21, v22, v23, v24, v25, v26);
      goto LABEL_27;
    }
  }
  else
  {
    self->_structuredLightIsOccluded = v8 == 1;
    if (v8 != 1)
      goto LABEL_27;
  }
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 0;
  LODWORD(v13) = 0;
  LODWORD(v14) = 0;
  -[BWFigVideoCaptureDevice updateSDOFBackgroundShiftSum:invalidShiftRatio:closeCanonicalDisparityAverage:faceCanonicalDisparityAverages:erodedForegroundRatio:foregroundRatio:occluded:faces:personSegmentationRatio:](self->_captureDevice, "updateSDOFBackgroundShiftSum:invalidShiftRatio:closeCanonicalDisparityAverage:faceCanonicalDisparityAverages:erodedForegroundRatio:foregroundRatio:occluded:faces:personSegmentationRatio:", 0, 1, 0, v9, v10, v11, v12, v13, v14);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  blankDisparityPixelBuffer = self->_blankDisparityPixelBuffer;
  v46 = v48;
  v28 = BWSampleBufferCreateFromPixelBuffer(blankDisparityPixelBuffer, (uint64_t)&v46, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&cf);
  if (v28)
  {
    v43 = v28;
    fig_log_get_emitter();
    v45 = v4;
    LODWORD(v44) = v43;
    FigDebugAssert3();
    goto LABEL_46;
  }
  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D086E8], MEMORY[0x1E0C9AAB0], 1u);
LABEL_27:
  v29 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("DepthDisabled"), 0), "BOOLValue");
  if (cf || v29)
  {
    v30 = -[BWVideoDepthNode inferencesToSkip]((os_unfair_lock_s *)self);
    v31 = v30;
    if (!self->_previousDisparitySampleBuffer
      && (-[os_unfair_lock_s containsObject:](v30, "containsObject:", &unk_1E49FA620) & 1) == 0)
    {
      self->_previousDisparitySampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
    if (!self->_previousFeaturesSampleBuffer
      && (-[os_unfair_lock_s containsObject:](v31, "containsObject:", &unk_1E49FA620) & 1) == 0)
    {
      self->_previousFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
    BWSampleBufferSetAttachedMedia(a3, 0x1E4951498, (uint64_t)self->_previousDisparitySampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, 0x1E4951518, (uint64_t)self->_disparityPostprocessingInStateSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, 0x1E49515D8, (uint64_t)self->_previousFeaturesSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, 0x1E4951538, (uint64_t)self->_disparityPostprocessingOutStateSampleBuffer);
    v32 = self->_previousFeaturesSampleBuffer;
    if (v32)
    {
      CFRelease(v32);
      self->_previousFeaturesSampleBuffer = 0;
    }
    v33 = self->_previousDisparitySampleBuffer;
    if (v33)
    {
      CFRelease(v33);
      self->_previousDisparitySampleBuffer = 0;
    }
    BWSampleBufferSetAttachedMedia(a3, 0x1E4951458, (uint64_t)cf);
    if (!-[BWInferenceEngine performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:](self->_inferenceEngine, "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", a3, a3, v31)&& (-[os_unfair_lock_s containsObject:](v31, "containsObject:", &unk_1E49FA620) & 1) == 0)
    {
      v34 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
      ImageBuffer = CMSampleBufferGetImageBuffer(v34);
      v46 = v48;
      if (!BWSampleBufferCreateFromPixelBuffer(ImageBuffer, (uint64_t)&v46, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&target))
      {
        v36 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v37 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), *MEMORY[0x1E0D06D00]);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("MirroredHorizontal")), CFSTR("MirroredHorizontal"));
        CMSetAttachment(target, v36, v38, 1u);

        BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("Depth"), (uint64_t)target);
        v39 = self->_disparityPostprocessingInStateSampleBuffer;
        self->_disparityPostprocessingInStateSampleBuffer = self->_disparityPostprocessingOutStateSampleBuffer;
        self->_disparityPostprocessingOutStateSampleBuffer = v39;
        v40 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E4951598);
        self->_previousDisparitySampleBuffer = v40;
        if (v40)
          CFRetain(v40);
        v41 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E49515F8);
        self->_previousFeaturesSampleBuffer = v41;
        if (v41)
          CFRetain(v41);
      }
    }
  }
LABEL_46:
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951498);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951458);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951478);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E49514D8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E49514F8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951598);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951418);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E49515B8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951538);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951518);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E49515D8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E49515F8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E4951438);
  if (cf)
    CFRelease(cf);
  if (target)
    CFRelease(target);
  if (self->_backpressureEvent)
  {
    v42 = -[BWInferenceEngine metalCommandBuffer](self->_inferenceEngine, "metalCommandBuffer");
    objc_msgSend(v42, "encodeSignalEvent:value:", self->_backpressureEvent, objc_msgSend((id)CMGetAttachment(a3, CFSTR("CinematicInferencesBackpressureEventNumber"), 0), "longLongValue"));
    objc_msgSend(v42, "commit");
    CMRemoveAttachment(a3, CFSTR("CinematicInferencesBackpressureEventNumber"));
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v44, v45);
}

- (os_unfair_lock_s)inferencesToSkip
{
  os_unfair_lock_s *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock(result + 30);
    v2 = (void *)objc_msgSend(*(id *)&v1[28]._os_unfair_lock_opaque, "copy");
    os_unfair_lock_unlock(v1 + 30);
    return (os_unfair_lock_s *)v2;
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!-[BWInferenceEngine prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:](self->_inferenceEngine, "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", self, self))-[BWFigVideoCaptureDevice setPreviewVideoDepthNodeUnprepared:](self->_captureDevice, "setPreviewVideoDepthNodeUnprepared:", 0);
}

- (void)setInferencesToSkip:(id)a3
{
  os_unfair_lock_s *p_inferenceTypesToSkipLock;
  NSSet *inferenceTypesToSkip;

  p_inferenceTypesToSkipLock = &self->_inferenceTypesToSkipLock;
  os_unfair_lock_lock(&self->_inferenceTypesToSkipLock);
  inferenceTypesToSkip = self->_inferenceTypesToSkip;
  if (inferenceTypesToSkip != a3)
  {

    self->_inferenceTypesToSkip = (NSSet *)objc_msgSend(a3, "copy");
  }
  os_unfair_lock_unlock(p_inferenceTypesToSkipLock);
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWVideoDepthNode)initWithInferenceScheduler:(id)a3 captureDevice:(id)a4 videoDepthConfiguration:(id)a5 extraDepthOutputRetainedBufferCount:(int)a6 error:(int *)a7
{
  BWVideoDepthNode *v12;
  uint64_t v13;
  BWFigVideoCaptureDevice *v14;
  BWNodeInput *v15;
  BWNodeInputMediaConfiguration *v16;
  BWVideoFormatRequirements *v17;
  BWNodeInputMediaConfiguration *v18;
  BWNodeOutput *v19;
  BWVideoFormatRequirements *v20;
  unsigned int v21;
  unint64_t v22;
  const void *PixelBuffer;
  const void *v24;
  BWNodeOutputMediaConfiguration *v25;
  BWInferenceEngine *v26;
  int v27;
  BWVideoFormatRequirements *v28;
  BWVideoFormatRequirements *v29;
  BWVideoFormatRequirements *v30;
  int v32;
  int v33;
  objc_super v34;
  BWVideoFormatRequirements *v35;
  uint64_t v36;
  BWVideoFormatRequirements *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)BWVideoDepthNode;
  v12 = -[BWNode init](&v34, sel_init);
  if (v12)
  {
    v12->_sourceIsNuri = objc_msgSend(a5, "sourceIsNuri");
    v13 = 2 * objc_msgSend(a5, "concurrencyWidth");
    v12->_inferenceScheduler = (BWInferenceScheduler *)a3;
    v14 = (BWFigVideoCaptureDevice *)a4;
    v12->_captureDevice = v14;
    if (!-[BWFigVideoCaptureDevice attachesUprightExifOrientationMetadataToStreamingFrames](v14, "attachesUprightExifOrientationMetadataToStreamingFrames"))-[BWFigVideoCaptureDevice setAttachesUprightExifOrientationMetadataToStreamingFrames:](v12->_captureDevice, "setAttachesUprightExifOrientationMetadataToStreamingFrames:", 1);
    v15 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v12);
    -[BWNodeInput setFormatRequirements:](v15, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v15, "setPassthroughMode:", 1);
    v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", &unk_1E4A00FC8);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", v17);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 0);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v16, CFSTR("Depth"));
    v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v33 = v13;
    -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v18, "setRetainedBufferCount:", v13);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v18, "setPassthroughMode:", 0);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v18, 0x1E49515B8);
    -[BWNode addInput:](v12, "addInput:", v15);

    v19 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v12);
    -[BWNodeOutput setPassthroughMode:](v19, "setPassthroughMode:", 1);
    -[BWNodeOutput setFormatRequirements:](v19, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    v20 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", &unk_1E4A00FE0);
    v21 = objc_msgSend(a5, "inputDimensions");
    v22 = (unint64_t)objc_msgSend(a5, "inputDimensions") >> 32;
    objc_msgSend(a5, "temporalDepthInputPixelFormat");
    v12->_initialDisparityPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
    v12->_previousDisparitySampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    v12->_depthOutputDimensions = ($470D365275581EF16070F5A11344F73E)objc_msgSend(a5, "outputDimensions");
    PixelBuffer = (const void *)CreatePixelBuffer();
    v12->_disparityPostprocessingInStateSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    if (PixelBuffer)
      CFRelease(PixelBuffer);
    v24 = (const void *)CreatePixelBuffer();
    v12->_disparityPostprocessingOutStateSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    if (v24)
      CFRelease(v24);
    -[BWVideoFormatRequirements setWidth:](v20, "setWidth:", v12->_depthOutputDimensions.width);
    -[BWVideoFormatRequirements setHeight:](v20, "setHeight:", v12->_depthOutputDimensions.height);
    v25 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v25, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v25, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v25, "setOwningNodeRetainedBufferCount:", (a6 + 1));
    v12->_backpressureEvent = (MTLEvent *)(id)objc_msgSend(a5, "backpressureEvent");
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v25, "setFormatRequirements:", v20);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v19, "setMediaConfiguration:forAttachedMediaKey:", v25, CFSTR("Depth"));
    -[BWNode addOutput:](v12, "addOutput:", v19);
    v26 = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", v12->_inferenceScheduler, 6);
    v12->_inferenceEngine = v26;
    v27 = -[BWInferenceEngine addInferenceOfType:version:configuration:](v26, "addInferenceOfType:version:configuration:", 109, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, a5);
    if (v27)
    {
      v32 = v27;
      fig_log_get_emitter();
      FigDebugAssert3();

      v12 = 0;
      *a7 = v32;
    }
    else
    {
      v28 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v28, "setSupportedPixelFormats:", &unk_1E4A00FF8);
      -[BWVideoFormatRequirements setWidth:](v28, "setWidth:", v21);
      -[BWVideoFormatRequirements setHeight:](v28, "setHeight:", v22);
      v38[0] = v28;
      v12->_internalDisparityVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1));
      v12->_internalDisparityPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v12->_internalDisparityVideoFormat, v33, CFSTR("VideoDepthNodeDisparityPool"), -[BWNodeOutput memoryPool](v12->super._output, "memoryPool"));
      v29 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v29, "setSupportedPixelFormats:", &unk_1E4A01010);
      -[BWVideoFormatRequirements setWidth:](v29, "setWidth:", (int)objc_msgSend(a5, "outputDimensions"));
      -[BWVideoFormatRequirements setHeight:](v29, "setHeight:", objc_msgSend(a5, "outputDimensions") >> 32);
      v37 = v29;
      v12->_disparityStateVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1));
      v30 = objc_alloc_init(BWVideoFormatRequirements);
      v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a5, "featuresPixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v30, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1));
      -[BWVideoFormatRequirements setWidth:](v30, "setWidth:", (int)objc_msgSend(a5, "featuresDimensions"));
      -[BWVideoFormatRequirements setHeight:](v30, "setHeight:", objc_msgSend(a5, "featuresDimensions") >> 32);
      v35 = v30;
      v12->_featuresVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1));
      v12->_featuresPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v12->_featuresVideoFormat, v33, CFSTR("VideoDepthNodeFeaturesPool"), -[BWNodeOutput memoryPool](v12->super._output, "memoryPool"));
      -[BWVideoFormatRequirements width](v30, "width");
      -[BWVideoFormatRequirements height](v30, "height");
      objc_msgSend(a5, "featuresPixelFormat");
      v12->_initialFeaturesPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
      v12->_previousFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[BWVideoDepthNode _releaseResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  if (a1)
  {

    *(_QWORD *)(a1 + 152) = 0;
    *(_QWORD *)(a1 + 96) = 0;

    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 128) = 0;

    *(_QWORD *)(a1 + 136) = 0;
    *(_QWORD *)(a1 + 256) = 0;

    *(_QWORD *)(a1 + 264) = 0;
    *(_QWORD *)(a1 + 272) = 0;

    *(_QWORD *)(a1 + 232) = 0;
    *(_QWORD *)(a1 + 240) = 0;

    *(_QWORD *)(a1 + 248) = 0;
    *(_QWORD *)(a1 + 112) = 0;
    v2 = *(const void **)(a1 + 192);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 192) = 0;
    }
    v3 = *(const void **)(a1 + 200);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 200) = 0;
    }
    v4 = *(const void **)(a1 + 144);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 144) = 0;
    }
    v5 = *(const void **)(a1 + 160);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 160) = 0;
    }
    v6 = *(const void **)(a1 + 176);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(a1 + 176) = 0;
    }
    v7 = *(const void **)(a1 + 184);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(a1 + 184) = 0;
    }
    v8 = *(const void **)(a1 + 208);
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(a1 + 208) = 0;
    }
    v9 = *(const void **)(a1 + 168);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(a1 + 168) = 0;
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWVideoDepthNode _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWVideoDepthNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (id)nodeSubType
{
  return CFSTR("VideoDepth");
}

- (id)inputFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedFormat");
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
}

@end
