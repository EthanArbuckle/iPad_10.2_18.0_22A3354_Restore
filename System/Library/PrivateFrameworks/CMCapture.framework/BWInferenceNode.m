@implementation BWInferenceNode

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a3, a4), "preparedPixelBufferPool");
}

- (id)nodeType
{
  return CFSTR("Inference");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutput *v7;
  BWInferenceEngine *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  BWNodeOutputMediaConfiguration *v19;
  uint64_t v20;
  uint64_t v21;
  BWNodeOutputMediaProperties *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = -[BWNode output](self, "output");
  if (objc_msgSend(a4, "mediaType") == 1986618469
    && -[BWNodeOutput mediaType](v7, "mediaType") == 1986618469)
  {
    v8 = -[BWInferenceNode inferenceEngine](self, "inferenceEngine");
    -[BWInferenceEngine prepareForInputVideoFormat:attachedMediaKey:](v8, "prepareForInputVideoFormat:attachedMediaKey:", a3, a5);
    v9 = -[BWInferenceEngine providedVideoRequirementsByAttachedMediaKey](v8, "providedVideoRequirementsByAttachedMediaKey");
    if (v9)
    {
      v10 = v9;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (!-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](v7, "mediaConfigurationForAttachedMediaKey:", v15))
            {
              v16 = -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v15);
              if (!v16)
                goto LABEL_17;
              v17 = objc_msgSend(v16, "videoFormat");
              if (!v17)
                goto LABEL_17;
              v18 = (void *)v17;
              v19 = objc_alloc_init(BWNodeOutputMediaConfiguration);
              -[BWNodeOutputMediaConfiguration setFormatRequirements:](v19, "setFormatRequirements:", -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(v18, "pixelBufferAttributes")));
              -[BWNodeOutputMediaConfiguration setPassthroughMode:](v19, "setPassthroughMode:", 0);
              -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v19, "setProvidesPixelBufferPool:", 1);
              -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v19, "setPixelBufferPoolProvidesBackPressure:", self->_backPressureDrivenPipelining);
              -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v19, "setPixelBufferPoolReportSlowBackPressureAllocations:", self->_backPressureDrivenPipelining);
              if (self->_additionalOutputPoolRetainedBufferCount)
                -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v19, "setOwningNodeRetainedBufferCount:");
              -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v7, "setMediaConfiguration:forAttachedMediaKey:", v19, v15);
              objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v7, "mediaPropertiesForAttachedMediaKey:", v15), "setResolvedFormat:", 0);
            }
          }
          v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v12);
      }
    }
  }
LABEL_17:
  if (-[BWNodeOutput _passthroughModeForAttachedMediaKey:](v7, "_passthroughModeForAttachedMediaKey:", a5))
  {
    v20 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](v7, "mediaConfigurationForAttachedMediaKey:", a5);
    v21 = -[BWNodeOutput primaryMediaConfiguration](v7, "primaryMediaConfiguration");
    if (!v20 || v20 == v21)
    {
      v22 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v7, "mediaPropertiesForAttachedMediaKey:", a5);
      if (!v22)
      {
        v22 = objc_alloc_init(BWNodeOutputMediaProperties);
        -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](v7, "_setMediaProperties:forAttachedMediaKey:", v22, a5);
      }
      -[BWNodeOutputMediaProperties setResolvedFormat:](v22, "setResolvedFormat:", a3);
    }
  }
}

- (BWInferenceEngine)inferenceEngine
{
  return self->_inferenceEngine;
}

- (uint64_t)_commonInit
{
  uint64_t v1;
  BWNodeInput *v2;
  BWNodeInputMediaConfiguration *v3;
  BWVideoFormatRequirements *v4;
  BWNodeInputMediaConfiguration *v5;
  BWNodeOutput *v6;
  BWNodeOutputMediaConfiguration *v7;

  if (result)
  {
    v1 = result;
    *(_QWORD *)(result + 104) = objc_alloc_init(MEMORY[0x1E0C99E60]);
    *(_DWORD *)(v1 + 112) = 0;
    v2 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v1);
    v3 = -[BWNodeInput primaryMediaConfiguration](v2, "primaryMediaConfiguration");
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v3, "setFormatRequirements:", v4);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v3, "setPassthroughMode:", 1);
    v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v2, "setUnspecifiedAttachedMediaConfiguration:", v5);
    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v1);
    v7 = -[BWNodeOutput primaryMediaConfiguration](v6, "primaryMediaConfiguration");
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v7, "setFormatRequirements:", v4);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v7, "setPassthroughMode:", 1);
    objc_msgSend((id)v1, "addInput:", v2);
    result = objc_msgSend((id)v1, "addOutput:", v6);
    *(_BYTE *)(v1 + 144) = 1;
  }
  return result;
}

- (BWInferenceNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5
{
  uint64_t v5;
  BWInferenceNode *v8;
  objc_super v10;

  v5 = *(_QWORD *)&a5;
  v10.receiver = self;
  v10.super_class = (Class)BWInferenceNode;
  v8 = -[BWNode init](&v10, sel_init);
  if (v8)
  {
    v8->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v8->_inferenceEngine = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", a4, v5);
    -[BWInferenceNode _commonInit]((uint64_t)v8);
  }
  return v8;
}

- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5
{
  int result;

  result = -[BWInferenceEngine addInferenceOfType:version:configuration:](self->_inferenceEngine, "addInferenceOfType:version:configuration:", *(_QWORD *)&a3, *(_QWORD *)&a4.var0 & 0xFFFFFFFFFFFFLL, a5);
  if (result)
    return -12780;
  return result;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  id result;
  BWInferenceVideoFormatRequirements *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_ignoreInvalidContentInformationForPrimaryMedia
    || !objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    return 0;
  }
  result = (id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
  if (result)
  {
    v6 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(result, "pixelBufferAttributes"));
    -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v6, "setIncludesInvalidContent:", 0);
    v7[0] = v6;
    return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  }
  return result;
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  const void *v8;
  CFTypeRef v9;
  CFTypeRef v10;
  void *v11;
  uint64_t v12;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v14;
  uint64_t v15;
  NSString *v16;
  NSString *recommendedMasterPortType;
  NSString *v18;
  NSString *v19;
  BWInferenceEngine *inferenceEngine;
  void *v21;
  uint64_t (**inferenceTypesToSkipResolver)(id, opaqueCMSampleBuffer *);
  void *v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  opaqueCMSampleBuffer *v29;
  __CVBuffer *ImageBuffer;
  __IOSurface *IOSurface;
  __IOSurface *v32;
  uint64_t (**postprocessFilter)(id, opaqueCMSampleBuffer *, const void *);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C40], 0);
  v7 = v6;
  if (v6)
    dispatch_group_enter(v6);
  if (a3)
    v8 = CFRetain(a3);
  else
    v8 = 0;
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v9 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    v10 = CMGetAttachment(a3, CFSTR("RecordingSettings"), 0);
    if (v10)
    {
      if (v9)
      {
        v11 = (void *)v10;
        if (CFEqual(v9, CFSTR("Start")))
        {
          if ((objc_msgSend(v11, "personSegmentationRenderingEnabled") & 1) != 0)
            v12 = 0;
          else
            v12 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E49FBC28, &unk_1E49FBC40, 0);
          -[BWInferenceNode setInferencesToSkip:](self, "setInferencesToSkip:", v12);
        }
      }
    }
    goto LABEL_47;
  }
  if (self->_applyRecommendedMasterPortType)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
    if (AttachedMedia)
    {
      v14 = AttachedMedia;
      v15 = objc_msgSend((id)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      v16 = (NSString *)CMGetAttachment(a3, CFSTR("RecommendedMasterPortType"), 0);
      if (v16)
      {
        recommendedMasterPortType = v16;
      }
      else
      {
        v18 = (NSString *)CMGetAttachment(v14, CFSTR("RecommendedMasterPortType"), 0);
        if (v18)
          recommendedMasterPortType = v18;
        else
          recommendedMasterPortType = self->_recommendedMasterPortType;
      }
      v19 = self->_recommendedMasterPortType;
      if (recommendedMasterPortType != v19)
      {

        recommendedMasterPortType = recommendedMasterPortType;
        self->_recommendedMasterPortType = recommendedMasterPortType;
      }
      if (-[NSString isEqualToString:](recommendedMasterPortType, "isEqualToString:", v15))
        goto LABEL_26;
      BWSampleBufferRemoveAllAttachedMedia(a3);
    }
  }
  v14 = a3;
LABEL_26:
  if (v8)
    CFRelease(v8);
  v8 = -[BWInferenceNode createOutputSampleBufferFromInput:]((CMSampleBufferRef)self, v14);
  inferenceEngine = self->_inferenceEngine;
  if (inferenceEngine && -[BWInferenceEngine isConfiguredForInference](inferenceEngine, "isConfiguredForInference"))
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
    inferenceTypesToSkipResolver = (uint64_t (**)(id, opaqueCMSampleBuffer *))self->_inferenceTypesToSkipResolver;
    if (inferenceTypesToSkipResolver)
      v21 = (void *)objc_msgSend(v21, "setByAddingObjectsFromSet:", inferenceTypesToSkipResolver[2](inferenceTypesToSkipResolver, v14));
    os_unfair_lock_lock(&self->_inferenceTypesToSkipLock);
    v23 = (void *)objc_msgSend(v21, "setByAddingObjectsFromSet:", self->_inferenceTypesToSkip);
    os_unfair_lock_unlock(&self->_inferenceTypesToSkipLock);
    objc_msgSend(v23, "count");
    if (!-[BWInferenceEngine performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:](self->_inferenceEngine, "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", v14, v8, v23))
    {
      if (self->_awaitAsynchronousOutputs)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v24 = -[BWInferenceEngine providedVideoRequirementsByAttachedMediaKey](self->_inferenceEngine, "providedVideoRequirementsByAttachedMediaKey");
        v25 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v35 != v27)
                objc_enumerationMutation(v24);
              v29 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v8, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
              ImageBuffer = CMSampleBufferGetImageBuffer(v29);
              if (ImageBuffer)
              {
                IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
                if (IOSurface)
                {
                  v32 = IOSurface;
                  IOSurfaceLock(IOSurface, 5u, 0);
                  IOSurfaceUnlock(v32, 5u, 0);
                }
              }
            }
            v26 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v26);
        }
      }
      postprocessFilter = (uint64_t (**)(id, opaqueCMSampleBuffer *, const void *))self->_postprocessFilter;
      if (postprocessFilter && (postprocessFilter[2](postprocessFilter, v14, v8) & 1) == 0)
      {
        if (v8)
        {
          CFRelease(v8);
          v8 = 0;
        }
      }
      else
      {
        -[BWInferenceNode willEmitSampleBuffer:](self, "willEmitSampleBuffer:", v8);
      }
    }
  }
LABEL_47:
  -[BWInferenceNode willEmitSampleBufferAlways:](self, "willEmitSampleBufferAlways:", v8);
  if (v7)
    dispatch_group_leave(v7);
  if (v8)
  {
    -[BWNodeOutput emitSampleBuffer:](-[BWNode output](self, "output"), "emitSampleBuffer:", v8);
    CFRelease(v8);
  }
}

- (CMSampleBufferRef)createOutputSampleBufferFromInput:(CMSampleBufferRef)result
{
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v3;

  if (result)
  {
    v3 = 0;
    if (*((_BYTE *)result + 144))
    {
      if (sbuf)
        return (CMSampleBufferRef)CFRetain(sbuf);
      else
        return 0;
    }
    else
    {
      memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
      sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, sbuf);
      sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
      CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v3);
      return v3;
    }
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[BWInferenceEngine isConfiguredForInference](self->_inferenceEngine, "isConfiguredForInference"))
  {
    -[BWInferenceEngine setBackPressureDrivenPipelining:](self->_inferenceEngine, "setBackPressureDrivenPipelining:", self->_backPressureDrivenPipelining);
    if (-[BWInferenceEngine prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:](self->_inferenceEngine, "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", self, self))
    {

      self->_inferenceEngine = 0;
    }
    else if (!-[BWFigVideoCaptureDevice attachesUprightExifOrientationMetadataToStreamingFrames](self->_captureDevice, "attachesUprightExifOrientationMetadataToStreamingFrames"))
    {
      -[BWFigVideoCaptureDevice setAttachesUprightExifOrientationMetadataToStreamingFrames:](self->_captureDevice, "setAttachesUprightExifOrientationMetadataToStreamingFrames:", -[BWInferenceEngine requiresDeviceOrientationMetadata](self->_inferenceEngine, "requiresDeviceOrientationMetadata"));
    }
  }
}

- (void)setApplyRecommendedMasterPortType:(BOOL)a3
{
  self->_applyRecommendedMasterPortType = a3;
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

- (void)setPostprocessFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setPassthroughInputSampleBuffer:(BOOL)a3
{
  self->_passthroughInputSampleBuffer = a3;
}

- (void)setInferenceTypesToSkipResolver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BWInferenceNode)initWithScheduler:(id)a3 priority:(unsigned int)a4
{
  uint64_t v4;
  BWInferenceNode *v6;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceNode;
  v6 = -[BWNode init](&v8, sel_init);
  if (v6)
  {
    v6->_inferenceEngine = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", a3, v4);
    -[BWInferenceNode _commonInit]((uint64_t)v6);
  }
  return v6;
}

- (void)setBackPressureDrivenPipelining:(BOOL)a3
{
  self->_backPressureDrivenPipelining = a3;
}

- (void)setIgnoreInvalidContentInformationForPrimaryMedia:(BOOL)a3
{
  self->_ignoreInvalidContentInformationForPrimaryMedia = a3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWInferenceNode _releaseResources]((id *)&self->super.super.isa);

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[12] = 0;
    a1[15] = 0;

    a1[17] = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWInferenceNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (NSString)description
{
  NSString *v3;
  objc_super v5;

  v3 = -[BWNode name](self, "name");
  if (v3 && -[NSString length](v3, "length"))
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), -[BWNode name](self, "name"), self);
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceNode;
  return (NSString *)-[BWNode description](&v5, sel_description);
}

- (id)nodeSubType
{
  return CFSTR("InferenceProducer");
}

- (int)addInferenceOfType:(int)a3 version:(id)a4
{
  return -[BWInferenceNode addInferenceOfType:version:configuration:](self, "addInferenceOfType:version:configuration:", *(_QWORD *)&a3, *(_QWORD *)&a4.var0 & 0xFFFFFFFFFFFFLL, -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 0));
}

- (BOOL)awaitAsynchronousOutputs
{
  return self->_awaitAsynchronousOutputs;
}

- (void)setAwaitAsynchronousOutputs:(BOOL)a3
{
  self->_awaitAsynchronousOutputs = a3;
}

- (BOOL)applyRecommendedMasterPortType
{
  return self->_applyRecommendedMasterPortType;
}

- (id)inputFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedFormat");
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedFormat");
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
}

- (BOOL)passthroughInputSampleBuffer
{
  return self->_passthroughInputSampleBuffer;
}

- (BOOL)ignoreInvalidContentInformationForPrimaryMedia
{
  return self->_ignoreInvalidContentInformationForPrimaryMedia;
}

- (int)additionalOutputPoolRetainedBufferCount
{
  return self->_additionalOutputPoolRetainedBufferCount;
}

- (void)setAdditionalOutputPoolRetainedBufferCount:(int)a3
{
  self->_additionalOutputPoolRetainedBufferCount = a3;
}

- (BOOL)backPressureDrivenPipelining
{
  return self->_backPressureDrivenPipelining;
}

- (id)inferenceTypesToSkipResolver
{
  return self->_inferenceTypesToSkipResolver;
}

- (id)postprocessFilter
{
  return self->_postprocessFilter;
}

@end
