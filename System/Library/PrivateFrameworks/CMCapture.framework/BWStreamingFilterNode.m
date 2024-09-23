@implementation BWStreamingFilterNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  id v9;
  objc_super v10;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    if (self)
      v9 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", 0);
    else
      v9 = 0;
    objc_msgSend(v9, "setFormat:", a3);
  }
  else if ((objc_msgSend(a5, "isEqualToString:", CFSTR("Depth")) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495AFB8) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495AFD8) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495AF78) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495AF98) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)BWStreamingFilterNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v10, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self)
    self = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3, a4, a5), "objectAtIndexedSubscript:", 0);
  -[BWStreamingFilterNode makeConfiguredFormatLive](self, "makeConfiguredFormatLive", a3, a4, a5);
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  BWNodeInputMediaConfiguration *v5;

  if (a3)
  {
    v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v5, "setPassthroughMode:", 0);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v5, "setDelayedBufferCount:", 1);
  }
  else
  {
    v5 = 0;
  }
  -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", v5, CFSTR("Depth"));
  self->_depthDataDeliveryEnabled = a3;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)filterDetectedFacesInSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_renderListLock;
  BWRenderList *v6;

  p_renderListLock = &self->_renderListLock;
  os_unfair_lock_lock(&self->_renderListLock);
  v6 = self->_currentRenderList;
  os_unfair_lock_unlock(p_renderListLock);
  -[BWRenderListProcessor adjustMetadataOfSampleBuffer:usingRenderList:](self->_renderListProcessor, "adjustMetadataOfSampleBuffer:usingRenderList:", a3, v6);

}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  _DWORD *v4;
  opaqueCMSampleBuffer *v5;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v8;
  const __CFDictionary *v9;
  unsigned int v10;
  int *v11;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v13;
  CVImageBufferRef v14;
  int v15;
  opaqueCMSampleBuffer *lastSampleBuffer;
  CFTypeRef v17;
  opaqueCMSampleBuffer *v18;
  uint64_t v19;
  BOOL v20;
  opaqueCMSampleBuffer *v21;
  const void *value;
  BOOL v23;
  BWRenderListAnimator *v24;
  BWRenderList *v25;
  uint64_t v26;
  id v27;
  BWRenderListProcessor *renderListProcessor;
  uint64_t v29;
  uint64_t v30;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v32[7];
  BOOL v33;
  CMTime v34;
  os_log_type_t type;
  int v36;
  CMTime v37;
  CMTime time;
  CMTime time2;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!a3)
    goto LABEL_78;
  v5 = a3;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
    goto LABEL_78;
  v8 = ImageBuffer;
  memset(&v37, 0, sizeof(v37));
  v9 = (const __CFDictionary *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
  CMTimeMakeFromDictionary(&v37, v9);
  if ((v37.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&time, v5);
    v37 = time;
  }
  v10 = self->_receivedFrameCounter + 1;
  self->_receivedFrameCounter = v10;
  self->_shouldLogPerFrameLogging = v10 % self->_perFrameLoggingRatio == 0;
  if (*v4 == 1)
  {
    time = v37;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  time = v37;
  time2 = (CMTime)self->_lastRenderedPTS;
  if ((CMTimeCompare(&time, &time2) & 0x80000000) == 0)
  {
    self->_lastRenderedPTS = ($95D729B680665BEAEFA1D6FCA8238556)v37;
    v11 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
    if (!self->_depthDataDeliveryEnabled)
      goto LABEL_35;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v5, (uint64_t)CFSTR("Depth"));
    if (!AttachedMedia)
      goto LABEL_82;
    v13 = AttachedMedia;
    v14 = CMSampleBufferGetImageBuffer(AttachedMedia);
    v15 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06E98]), "BOOLValue");
    self->_receivedOccludedFixedPointDisparityBuffer = v15;
    if (v15 && self->_shouldLogPerFrameLogging && dword_1ECFE95D0)
    {
      v36 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    if (!v14)
    {
LABEL_82:
      if (-[BWFigVideoCaptureDevice shallowDepthOfFieldEffectEnabled](self->_captureDevice, "shallowDepthOfFieldEffectEnabled", v29, v30))
      {
        os_unfair_lock_lock(&self->_lastSampleBufferLock);
        lastSampleBuffer = self->_lastSampleBuffer;
        if (lastSampleBuffer)
        {
          v17 = CFRetain(lastSampleBuffer);
          os_unfair_lock_unlock(&self->_lastSampleBufferLock);
          if (v17)
          {
            v18 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v17, (uint64_t)CFSTR("Depth"));
            v19 = (uint64_t)v18;
            if (v18)
              v14 = CMSampleBufferGetImageBuffer(v18);
            else
              v14 = 0;
            BWSampleBufferSetAttachedMedia(v5, (uint64_t)CFSTR("Depth"), v19);
            CFRelease(v17);
            goto LABEL_27;
          }
        }
        else
        {
          os_unfair_lock_unlock(&self->_lastSampleBufferLock);
        }
      }
      v11 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      if (!self->_receivedInitialFixedPointDisparityBuffer)
        goto LABEL_35;
      v20 = 0;
LABEL_31:
      if (*((_BYTE *)&self->super.super.isa + v11[67]))
        goto LABEL_35;
      if (self->_portraitAutoSuggestEnabled)
        v20 = 1;
      if (v20)
        goto LABEL_35;
LABEL_78:
      FigDebugAssert3();
      goto LABEL_71;
    }
LABEL_27:
    v20 = v14 != 0;
    if (!self->_receivedInitialFixedPointDisparityBuffer && v14)
    {
      self->_receivedInitialFixedPointDisparityBuffer = 1;
      v11 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      goto LABEL_35;
    }
    v11 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
    if (!self->_receivedInitialFixedPointDisparityBuffer)
    {
LABEL_35:
      if (!self->_semanticStyleRenderingEnabled)
      {
        v23 = 0;
LABEL_61:
        CMSetAttachment(v5, CFSTR("StructuredLightRecentlyOccluded"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)&self->super.super.isa + v11[67]), v29), 1u);
        os_unfair_lock_lock(&self->_renderListLock);
        if (-[BWRenderList isPrepared](self->_nextRenderList, "isPrepared"))
        {

          self->_currentAnimator = self->_nextAnimator;
          self->_currentRenderList = self->_nextRenderList;
          self->_nextAnimator = 0;
          self->_nextRenderList = 0;
        }
        v24 = self->_currentAnimator;
        v25 = self->_currentRenderList;
        os_unfair_lock_unlock(&self->_renderListLock);
        if (v24)
        {
          v26 = -[BWRenderListAnimator interpolateParameters](v24, "interpolateParameters");
          if (-[BWRenderListAnimator isCompleted](v24, "isCompleted"))
          {
            os_unfair_lock_lock(&self->_renderListLock);
            if (!self->_nextAnimator && !self->_nextRenderList)
            {
              self->_nextAnimator = 0;
              self->_nextRenderList = -[BWRenderListAnimator finalRenderList](v24, "finalRenderList");
            }
            os_unfair_lock_unlock(&self->_renderListLock);
          }
        }
        else
        {
          v26 = 0;
        }
        v27 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", 0);
        renderListProcessor = self->_renderListProcessor;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __53__BWStreamingFilterNode_renderSampleBuffer_forInput___block_invoke;
        v32[3] = &unk_1E491FAD8;
        v32[5] = v27;
        v32[6] = v5;
        v32[4] = self;
        v33 = v23;
        -[BWRenderListProcessor processRenderList:withParameters:inputPixelBuffer:inputSampleBuffer:resultHandler:](renderListProcessor, "processRenderList:withParameters:inputPixelBuffer:inputSampleBuffer:resultHandler:", v25, v26, v8, v5, v32);

LABEL_71:
        if (*v4 != 1)
          return;
        goto LABEL_72;
      }
      if (*v4 == 1)
      {
        CMSampleBufferGetPresentationTimeStamp(&v34, v5);
        time = v34;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      os_unfair_lock_lock(&self->_lastSampleBufferLock);
      time.value = 0;
      BWCMSampleBufferCreateCopyIncludingMetadata(v5, (CMSampleBufferRef *)&time);
      v21 = self->_lastSampleBuffer;
      value = (const void *)time.value;
      v23 = v21 == v5;
      if (v21 == v5)
      {
        if (!time.value)
        {
          v5 = 0;
          goto LABEL_49;
        }
        v5 = (opaqueCMSampleBuffer *)CFRetain((CFTypeRef)time.value);
      }
      else
      {
        self->_lastSampleBuffer = (opaqueCMSampleBuffer *)time.value;
        if (value)
          CFRetain(value);
        if (v21)
          CFRelease(v21);
      }
      if (time.value)
        CFRelease((CFTypeRef)time.value);
LABEL_49:
      os_unfair_lock_unlock(&self->_lastSampleBufferLock);
      if (self->_streamingSegmentationFromInferenceEngine && !self->_maskVisualizationEnabled)
      {
        if (!self->_haveSeenFirstSampleBuffer)
        {
          if (!BWSampleBufferGetAttachedMedia(v5, 0x1E495AF78))
          {
            self->_applyStyleBackgroundToEntireFrame = 1;
            goto LABEL_77;
          }
LABEL_75:
          self->_haveSeenFirstSampleBuffer = 1;
          goto LABEL_56;
        }
        if (self->_applyStyleBackgroundToEntireFrame)
        {
          if (BWSampleBufferGetAttachedMedia(v5, 0x1E495AF78))
          {
            self->_applyStyleBackgroundToEntireFrame = 0;
LABEL_77:
            self->_haveSeenFirstSampleBuffer = 1;
            -[BWStreamingFilterNode semanticStyleSceneType](self, "semanticStyleSceneType", v29);
            -[BWStreamingFilterNode _rebuildSemanticStyleFiltersWithSceneType:]((uint64_t)self);
LABEL_56:
            -[BWStreamingFilterNode _applyQueuedSemanticStyle:]((uint64_t)self, v5);
            os_unfair_lock_lock(&self->_filterChangeLock);
            if (self->_renderingSemanticStyleSet && BWSampleBufferGetAttachedMedia(v5, 0x1E495B198))
              BWSampleBufferRemoveAttachedMedia(v5, 0x1E495B198);
            os_unfair_lock_unlock(&self->_filterChangeLock);
            if (*v4 == 1)
              kdebug_trace();
            goto LABEL_61;
          }
          goto LABEL_75;
        }
      }
      self->_haveSeenFirstSampleBuffer = 1;
      goto LABEL_56;
    }
    goto LABEL_31;
  }
  if (*v4 != 1)
    return;
LABEL_72:
  kdebug_trace();
}

- (void)_applyQueuedSemanticStyle:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  id v6;
  const __CFDictionary *v7;
  CGSize size;
  CGRect v9;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1A858DD40]();
    v5 = objc_msgSend(*(id *)(a1 + 216), "dequeueFencedAnimation");
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));

      *(_QWORD *)(a1 + 280) = (id)objc_msgSend((id)v5, "semanticStyleSet");
      v6 = (id)objc_msgSend((id)v5, "fencePortSendRight");
      v5 = objc_msgSend((id)v5, "fencePortGenerationCount");
      if (*MEMORY[0x1E0CA1FC0] == 1)
      {
        objc_msgSend(*(id *)(a1 + 216), "count");
        objc_msgSend(*(id *)(a1 + 280), "leftmostRegionStartXOffset");
        objc_msgSend(v6, "port");
        kdebug_trace();
      }
      -[BWStreamingFilterNode _updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:]((const os_unfair_lock *)a1, a2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
    }
    else
    {
      v6 = 0;
    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if (*(_QWORD *)(a1 + 272))
    {
      v7 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
      if (v7)
      {
        memset(&v9, 0, sizeof(v9));
        CGRectMakeWithDictionaryRepresentation(v7, &v9);
        if (!CGRectEqualToRect(*(CGRect *)(a1 + 288), v9))
        {
          size = v9.size;
          *(CGPoint *)(a1 + 288) = v9.origin;
          *(CGSize *)(a1 + 304) = size;
          -[BWStreamingFilterNode _adjustRectanglesFromFiltersAndRegionArray:withSampleBuffer:](a1, *(void **)(a1 + 272), a2);
        }
      }
      CMSetAttachment(a2, CFSTR("FiltersAndRegionArray"), *(CFTypeRef *)(a1 + 272), 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    if (v6)
    {
      CMSetAttachment(a2, CFSTR("CAContextFencePortSendRight"), v6, 1u);

    }
    if (v5 >= 1)
      CMSetAttachment(a2, CFSTR("CAContextFencePortGenerationID"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5), 1u);
  }
}

void __53__BWStreamingFilterNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1, char a2, CMAttachmentBearerRef target, uint64_t a4)
{
  _DWORD *v7;
  const __CFDictionary *v8;
  CVImageBufferRef ImageBuffer;
  int v10;
  const void *v11;
  CMTime v12;
  CMTime time;

  if ((a2 & 2) != 0 && !a4)
  {
    CMSetAttachment(target, CFSTR("FiltersApplied"), MEMORY[0x1E0C9AAB0], 1u);
    v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0])
    {
      memset(&v12, 0, sizeof(v12));
      v8 = (const __CFDictionary *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E0D05D00], 0);
      CMTimeMakeFromDictionary(&v12, v8);
      if ((v12.flags & 1) == 0)
      {
        CMSampleBufferGetPresentationTimeStamp(&time, *(CMSampleBufferRef *)(a1 + 48));
        v12 = time;
      }
      if (*v7 == 1)
      {
        time = v12;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "attachesInputPixelBufferAfterRendering"))
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 48));
      if (!ImageBuffer)
      {
LABEL_20:
        FigDebugAssert3();
        v10 = 0;
        goto LABEL_13;
      }
      CMSetAttachment(target, CFSTR("UnfilteredPixelBuffer"), ImageBuffer, 1u);
    }
  }
  if (!target)
    goto LABEL_20;
  v10 = 1;
LABEL_13:
  BWSampleBufferRemoveAttachedMedia(target, (uint64_t)CFSTR("Depth"));
  BWSampleBufferRemoveAttachedMedia(target, 0x1E495AF78);
  BWSampleBufferRemoveAttachedMedia(target, 0x1E495AFB8);
  BWSampleBufferRemoveAttachedMedia(target, 0x1E495AF98);
  BWSampleBufferRemoveAttachedMedia(target, 0x1E495AFD8);
  if (!a4 && v10)
    objc_msgSend(*(id *)(a1 + 40), "emitSampleBuffer:", target);
  if (*(_BYTE *)(a1 + 56))
  {
    v11 = *(const void **)(a1 + 48);
    if (v11)
      CFRelease(v11);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  os_unfair_lock_s *p_renderListLock;
  BWRenderList *v4;
  uint64_t v5;
  id v6;
  NSObject *processorPreparationQueue;
  _OWORD *v8;
  objc_super v9;
  _QWORD block[7];

  self->_preparedToBecomeLive = 1;
  p_renderListLock = &self->_renderListLock;
  os_unfair_lock_lock(&self->_renderListLock);
  v4 = self->_nextRenderList;
  os_unfair_lock_unlock(p_renderListLock);
  if (v4)
  {
    v5 = objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", CFSTR("PrimaryFormat")), "resolvedVideoFormat");
    v6 = -[BWNodeInput mediaPropertiesByAttachedMediaKey](self->super._input, "mediaPropertiesByAttachedMediaKey");
    processorPreparationQueue = self->_processorPreparationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__BWStreamingFilterNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
    block[3] = &unk_1E491EB90;
    block[4] = v4;
    block[5] = v5;
    block[6] = v6;
    dispatch_sync(processorPreparationQueue, block);
    os_unfair_lock_lock(p_renderListLock);
    if (-[BWRenderList isPrepared](self->_nextRenderList, "isPrepared"))
    {

      self->_currentRenderList = v4;
    }
    os_unfair_lock_unlock(p_renderListLock);
  }
  self->_receivedInitialFixedPointDisparityBuffer = 0;
  self->_receivedOccludedFixedPointDisparityBuffer = 0;
  v8 = (_OWORD *)MEMORY[0x1E0CA2E68];
  self->_lastRenderedPTS.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)&self->_lastRenderedPTS.value = *v8;
  v9.receiver = self;
  v9.super_class = (Class)BWStreamingFilterNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v9, sel_prepareForCurrentConfigurationToBecomeLive);
}

uint64_t __67__BWStreamingFilterNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setStudioAndContourRenderingEnabled:(BOOL)a3
{
  self->_studioAndContourRenderingEnabled = a3;
}

- (void)setStreamingSegmentationFromInferenceEngine:(BOOL)a3
{
  uint64_t v5;
  BWNodeInput *input;
  BWNodeInputMediaConfiguration *v7;
  BWNodeInput *v8;

  if (a3)
  {
    if (self->_primaryStreamingPersonSegmentationEnabled)
    {
      v5 = 1;
      if (self->_semanticStyleRenderingEnabled)
      {
        if (-[BWFigVideoCaptureDevice shallowDepthOfFieldEffectEnabled](self->_captureDevice, "shallowDepthOfFieldEffectEnabled"))
        {
          v5 = 2;
        }
        else
        {
          v5 = 1;
        }
      }
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", simpleInputMediaConfigurationWithDelayedBufferCount(v5), 0x1E495AF78);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", simpleInputMediaConfigurationWithDelayedBufferCount(v5), 0x1E495AFB8);
    }
    if (self->_secondaryStreamingPersonSegmentationEnabled)
    {
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", simpleInputMediaConfigurationWithDelayedBufferCount(1), 0x1E495AF98);
      input = self->super._input;
      v7 = simpleInputMediaConfigurationWithDelayedBufferCount(1);
      v8 = input;
LABEL_14:
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v8, "setMediaConfiguration:forAttachedMediaKey:", v7, 0x1E495AFD8);
    }
  }
  else
  {
    if (self->_primaryStreamingPersonSegmentationEnabled)
    {
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", 0, 0x1E495AF78);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", 0, 0x1E495AF98);
    }
    if (self->_secondaryStreamingPersonSegmentationEnabled)
    {
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", 0, 0x1E495AFB8);
      v8 = self->super._input;
      v7 = 0;
      goto LABEL_14;
    }
  }
  self->_streamingSegmentationFromInferenceEngine = a3;
}

- (void)setStageRenderingEnabled:(BOOL)a3
{
  self->_stageRenderingEnabled = a3;
}

- (void)setPortraitAutoSuggestEnabled:(BOOL)a3
{
  self->_portraitAutoSuggestEnabled = a3;
}

- (void)setMetadataProcessingEnabled:(BOOL)a3
{
  self->_metadataProcessingEnabled = a3;
}

- (void)setFocusBlurMapDeliveryEnabled:(BOOL)a3
{
  self->_focusBlurMapDeliveryEnabled = a3;
}

- (void)setDepthFromMonocularNetworkEnabled:(BOOL)a3
{
  self->_depthFromMonocularNetworkEnabled = a3;
}

- (void)setAttachesInputPixelBufferAfterRendering:(BOOL)a3
{
  self->_attachesInputPixelBufferAfterRendering = a3;
}

- (void)changeToFilters:(id)a3 semanticStyle:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  os_unfair_lock_s *p_filterChangeLock;
  FigCaptureSemanticStyle *semanticStyle;

  v5 = a5;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  semanticStyle = self->_semanticStyle;
  if (semanticStyle != a4
    && !-[FigCaptureSemanticStyle isEqual:](semanticStyle, "isEqual:", a4)
    && !self->_semanticStyleRenderingEnabled)
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not configured for semantic style rendering"), self), 0));
  }

  self->_filters = (NSArray *)a3;
  self->_semanticStyle = (FigCaptureSemanticStyle *)a4;
  -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v5);
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (void)prepareForRenderingWithPreparedPixelBufferPool
{
  if (!self->_renderListProcessor)
    self->_renderListProcessor = -[BWRenderListProcessor initWithRenderingPool:]([BWRenderListProcessor alloc], "initWithRenderingPool:", -[BWNodeOutputMediaProperties preparedPixelBufferPool](-[BWNodeOutput primaryMediaProperties](self->super._output, "primaryMediaProperties"), "preparedPixelBufferPool"));
}

- (const)_buildAndChangeToFiltersWithAnimation:(const os_unfair_lock *)result
{
  const os_unfair_lock *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    os_unfair_lock_assert_owner(result + 40);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (!LOBYTE(v2[67]._os_unfair_lock_opaque))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v4 = *(void **)&v2[42]._os_unfair_lock_opaque;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v17 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            NSClassFromString(CFSTR("CIDepthEffect"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSClassFromString(CFSTR("CIPortraitEffect"));
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                NSClassFromString(CFSTR("CIPortraitEffectV2"));
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
              }
            }
            objc_msgSend(v3, "addObject:", v9);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v6);
      }
    }
    objc_msgSend(*(id *)&v2[108]._os_unfair_lock_opaque, "setShallowDepthOfFieldEffectEnabled:", objc_msgSend(v3, "count") != 0);
    if (-[BWStreamingFilterNode _shouldRenderSemanticStyle](v2)
      && (v10 = *(_QWORD *)&v2[48]._os_unfair_lock_opaque) != 0)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)&v2[42]._os_unfair_lock_opaque);
      objc_msgSend(v11, "removeObjectsInArray:", v3);
      v12 = (uint64_t)v14;
      objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(*(id *)&v2[90]._os_unfair_lock_opaque, "filtersForSemanticStyle:sceneType:personSegmentationEnabled:maskVisualizationEnabled:applyStyleBackgroundToEntireFrame:filtersToCombine:", v10, v2[52]._os_unfair_lock_opaque, BYTE1(v2[24]._os_unfair_lock_opaque), LOBYTE(v2[93]._os_unfair_lock_opaque), HIBYTE(v2[26]._os_unfair_lock_opaque), v11));
      objc_msgSend(v14, "addObjectsFromArray:", v3);
      v13 = a2;
    }
    else
    {
      v12 = (uint64_t)v14;
      v13 = a2;
      if (*(_QWORD *)&v2[42]._os_unfair_lock_opaque)
        objc_msgSend(v14, "addObjectsFromArray:");
    }
    return -[BWStreamingFilterNode _changeToFilters:animation:](v2, v12, v13);
  }
  return result;
}

- (const)_shouldRenderSemanticStyle
{
  const os_unfair_lock *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 40);
    if (LOBYTE(v1[50]._os_unfair_lock_opaque))
    {
      return 0;
    }
    else if (LOBYTE(v1[67]._os_unfair_lock_opaque))
    {
      return (const os_unfair_lock *)1;
    }
    else
    {
      return (const os_unfair_lock *)(objc_msgSend(*(id *)&v1[48]._os_unfair_lock_opaque, "isIdentity") ^ 1);
    }
  }
  return result;
}

- (const)_changeToFilters:(uint64_t)a3 animation:
{
  const os_unfair_lock *v5;
  BWRenderList *v6;
  BWRenderList *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BWRenderListAnimator *v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  double v18;
  _QWORD v19[10];

  if (result)
  {
    v5 = result;
    os_unfair_lock_assert_owner(result + 40);
    v6 = -[BWRenderList initWithResourceProvider:originalFilters:processedFilters:optimizationStrategy:stillImageSettings:]([BWRenderList alloc], "initWithResourceProvider:originalFilters:processedFilters:optimizationStrategy:stillImageSettings:", v5, 0, a2, 4 * LOBYTE(v5[46]._os_unfair_lock_opaque), 0);
    v7 = v6;
    *(_QWORD *)&v5[36]._os_unfair_lock_opaque = v6;
    if (a3 && -[BWRenderList supportsAnimation](v6, "supportsAnimation"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&v5[28]);
      v8 = *(id *)&v5[32]._os_unfair_lock_opaque;
      v9 = *(id *)&v5[30]._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&v5[28]);
      if (v8)
      {
        v10 = objc_msgSend(v8, "renderList");
        v11 = objc_msgSend(v8, "parameters");
      }
      else
      {
        v11 = 0;
        v10 = (uint64_t)v9;
      }
      if ((objc_msgSend(v9, "supportsAnimation") & 1) != 0 || !v9)
      {
        v12 = -[BWRenderListAnimator initWithInitialParameters:initialRenderList:finalParameters:finalRenderList:animation:]([BWRenderListAnimator alloc], "initWithInitialParameters:initialRenderList:finalParameters:finalRenderList:animation:", v11, v10, 0, v7, a3);
        if (v12)
        {

          v7 = -[BWRenderListAnimator renderList](v12, "renderList");
        }
      }
      else
      {
        v12 = 0;
      }

      if (!LOBYTE(v5[24]._os_unfair_lock_opaque)
        || -[BWRenderList isPrepared](v7, "isPrepared") && -[BWRenderListAnimator isPrepared](v12, "isPrepared"))
      {
        goto LABEL_19;
      }
LABEL_20:
      os_unfair_lock_lock((os_unfair_lock_t)&v5[28]);
      v14 = *(id *)&v5[34]._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&v5[28]);
      v15 = objc_msgSend((id)objc_msgSend(*(id *)&v5[2]._os_unfair_lock_opaque, "mediaPropertiesForAttachedMediaKey:", CFSTR("PrimaryFormat")), "resolvedVideoFormat");
      v16 = objc_msgSend(*(id *)&v5[2]._os_unfair_lock_opaque, "mediaPropertiesByAttachedMediaKey");
      v17 = *(NSObject **)&v5[106]._os_unfair_lock_opaque;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __52__BWStreamingFilterNode__changeToFilters_animation___block_invoke;
      v19[3] = &unk_1E491FB00;
      v19[4] = v12;
      v19[5] = v15;
      v19[6] = v16;
      v19[7] = v7;
      v19[8] = v5;
      v19[9] = v14;
      dispatch_async(v17, v19);

      goto LABEL_21;
    }
    if (LOBYTE(v5[24]._os_unfair_lock_opaque))
    {
      v12 = 0;
      if (!-[BWRenderList isPrepared](v7, "isPrepared"))
        goto LABEL_20;
    }
    else
    {
      v12 = 0;
    }
LABEL_19:
    os_unfair_lock_lock((os_unfair_lock_t)&v5[28]);

    *(_QWORD *)&v5[38]._os_unfair_lock_opaque = v12;
    *(_QWORD *)&v5[34]._os_unfair_lock_opaque = v7;
    os_unfair_lock_unlock((os_unfair_lock_t)&v5[28]);
LABEL_21:
    LODWORD(v13) = v5[96];
    objc_msgSend(*(id *)&v5[94]._os_unfair_lock_opaque, "setSimulatedAperture:", v13);
    LODWORD(v18) = v5[97];
    return (const os_unfair_lock *)objc_msgSend(*(id *)&v5[94]._os_unfair_lock_opaque, "setPortraitLightingEffectStrength:", v18);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStreamingFilterNode)initWithCaptureDevice:(id)a3 maxLossyCompressionLevel:(int)a4 semanticStyleRenderingEnabled:(BOOL)a5 cinematicVideoEnabled:(BOOL)a6 smartStyleRenderingEnabled:(BOOL)a7 portraitPreviewForegroundBlurEnabled:(BOOL)a8 metalCommandQueue:(id)a9 priority:(unsigned int)a10 mirroredForMetadataAdjustment:(BOOL)a11 rotationDegreesForMetadataAdjustment:(int)a12
{
  _BOOL4 v14;
  _BOOL4 v15;
  BWStreamingFilterNode *v18;
  BWStreamingFilterNode *v19;
  BWNodeInput *v20;
  BWVideoFormatRequirements *v21;
  void *v22;
  void *v23;
  BWNodeOutput *v24;
  BWVideoFormatRequirements *v25;
  objc_super v32;

  v14 = a6;
  v15 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BWStreamingFilterNode;
  v18 = -[BWNode init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_smartStyleRenderingEnabled = a7;
    v20 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v18, 0);
    v19->_cinematicVideoEnabled = v14;
    v19->_metalCommandQueue = (MTLCommandQueue *)a9;
    v19->_priority = a10;
    v21 = objc_alloc_init(BWVideoFormatRequirements);
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A003C8);
    v23 = v22;
    if (v14)
      objc_msgSend(v22, "addObjectsFromArray:", &unk_1E4A003E0);
    objc_msgSend(v23, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, v14, v14, a4));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", v23);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v20, "primaryMediaConfiguration"), "setFormatRequirements:", v21);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v20, "primaryMediaConfiguration"), "setPassthroughMode:", 2);
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](-[BWNodeInput primaryMediaConfiguration](v20, "primaryMediaConfiguration"), "setDelayedBufferCount:", 1);
    -[BWNode addInput:](v19, "addInput:", v20);

    v24 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v19);
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", v23);
    -[BWNodeOutput setFormatRequirements:](v24, "setFormatRequirements:", v25);
    -[BWNodeOutput setPassthroughMode:](v24, "setPassthroughMode:", 2);
    -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v24, "setIndexOfInputWhichDrivesThisOutput:", 0);
    -[BWNode addOutput:](v19, "addOutput:", v24);

    v19->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
    v19->_filterChangeLock._os_unfair_lock_opaque = 0;
    v19->_semanticStyleRenderingEnabled = v15;
    v19->_semanticStyleSceneLock._os_unfair_lock_opaque = 0;
    v19->_primaryCaptureRect.origin.x = 0.0;
    v19->_primaryCaptureRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v19->_primaryCaptureRect.size = _Q0;
    v19->_fullScreenRectangle.origin.x = 0.0;
    v19->_fullScreenRectangle.origin.y = 0.0;
    v19->_fullScreenRectangle.size = _Q0;
    if (v15)
    {
      v19->_fencedAnimationQueue = -[BWFencedAnimationQueue initWithQueueSize:]([BWFencedAnimationQueue alloc], "initWithQueueSize:", 1);
      v19->_multipleSemanticStylesEnabled = 1;
    }
    v19->_lastSampleBufferLock._os_unfair_lock_opaque = 0;
    v19->_semanticStyleSetLock._os_unfair_lock_opaque = 0;
    v19->_colorCubeCache = -[BWSemanticStyleColorCubeCache initWithColorLookupCache:]([BWSemanticStyleColorCubeCache alloc], "initWithColorLookupCache:", v19->_colorLookupCache);
    v19->_pickerComparisonMaxCubeStrength = 1.25;
    v19->_portraitLightingEffectStrength = NAN;
    v19->_renderListLock._os_unfair_lock_opaque = 0;
    v19->_processorPreparationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v19->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v19->_mixColorCubesInGammaDomain = 1;
    v19->_portraitPreviewForegroundBlurEnabled = a8;
    v19->_perFrameLoggingRatio = 30;
    v19->_mirroredForMetadataAdjustment = a11;
    v19->_rotationDegreesForMetadataAdjustment = a12;
  }
  return v19;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *lastSampleBuffer;
  objc_super v4;

  lastSampleBuffer = self->_lastSampleBuffer;
  if (lastSampleBuffer)
    CFRelease(lastSampleBuffer);

  v4.receiver = self;
  v4.super_class = (Class)BWStreamingFilterNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("StreamingFilter");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  opaqueCMSampleBuffer *lastSampleBuffer;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  -[BWRenderListProcessor waitForAllProcessingToComplete](self->_renderListProcessor, "waitForAllProcessingToComplete", a3);
  -[BWFencedAnimationQueue flush](self->_fencedAnimationQueue, "flush");
  os_unfair_lock_lock(&self->_lastSampleBufferLock);
  lastSampleBuffer = self->_lastSampleBuffer;
  if (lastSampleBuffer)
  {
    CFRelease(lastSampleBuffer);
    self->_lastSampleBuffer = 0;
  }
  os_unfair_lock_unlock(&self->_lastSampleBufferLock);
  self->_preparedToBecomeLive = 0;
  v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", 0);
  v6 = FigDispatchQueueCreateWithPriority();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__BWStreamingFilterNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = v5;
  dispatch_async(v6, block);

}

uint64_t __51__BWStreamingFilterNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markEndOfLiveOutput");
}

- (void)_rebuildSemanticStyleFiltersWithSceneType:(uint64_t)a1
{
  int *v2;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 272))
    {
      v2 = &OBJC_IVAR___BWStreamingFilterNode__semanticStyleSetLock;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
      -[BWStreamingFilterNode _updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:]((const os_unfair_lock *)a1, 0);
    }
    else
    {
      v2 = &OBJC_IVAR___BWStreamingFilterNode__filterChangeLock;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
      -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)a1, 2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + *v2));
  }
}

- (void)changeToFilters:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_filterChangeLock;

  v4 = a4;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);

  self->_filters = (NSArray *)a3;
  -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v4);
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (NSArray)filters
{
  os_unfair_lock_s *p_filterChangeLock;
  NSArray *filters;

  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  filters = self->_filters;
  os_unfair_lock_unlock(p_filterChangeLock);
  return filters;
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (BOOL)isRenderingSemanticStyle
{
  BWStreamingFilterNode *v2;
  os_unfair_lock_s *p_filterChangeLock;

  v2 = self;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  LOBYTE(v2) = -[BWStreamingFilterNode _shouldRenderSemanticStyle]((const os_unfair_lock *)v2);
  os_unfair_lock_unlock(p_filterChangeLock);
  return (char)v2;
}

- (void)changeToSemanticStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_filterChangeLock;

  v4 = a4;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (!self->_semanticStyleRenderingEnabled)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not configured for semantic style rendering"), self), 0));

  self->_semanticStyle = (FigCaptureSemanticStyle *)a3;
  self->_semanticStyleFiltersAndRegionArray = 0;
  self->_renderingSemanticStyleSet = 0;
  -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v4);
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (FigCaptureSemanticStyle)semanticStyle
{
  os_unfair_lock_s *p_semanticStyleSetLock;
  FigCaptureSemanticStyleSet *v4;
  os_unfair_lock_s *p_filterChangeLock;
  BOOL v6;
  FigCaptureSemanticStyle *semanticStyle;
  FigCaptureSemanticStyle *v8;

  p_semanticStyleSetLock = &self->_semanticStyleSetLock;
  os_unfair_lock_lock(&self->_semanticStyleSetLock);
  v4 = self->_currentSemanticStyleSet;
  os_unfair_lock_unlock(p_semanticStyleSetLock);
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (self->_semanticStyleFiltersAndRegionArray)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
    semanticStyle = self->_semanticStyle;
  else
    semanticStyle = -[FigCaptureSemanticStyleSet largestRegionSemanticStyle](v4, "largestRegionSemanticStyle");
  v8 = semanticStyle;
  os_unfair_lock_unlock(p_filterChangeLock);

  return v8;
}

- (void)setSemanticStyleRenderingSuspended:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  os_unfair_lock_s *p_filterChangeLock;
  uint64_t v8;

  v4 = a4;
  v5 = a3;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (!self->_semanticStyleRenderingEnabled)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not configured for semantic style rendering"), self), 0));
  if (self->_semanticStyleRenderingSuspended != v5)
  {
    self->_semanticStyleRenderingSuspended = v5;
    if (v4)
      v8 = 3;
    else
      v8 = 0;
    -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v8);
  }
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (BOOL)isSemanticStyleRenderingSuspended
{
  BWStreamingFilterNode *v2;
  os_unfair_lock_s *p_filterChangeLock;

  v2 = self;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  LOBYTE(v2) = v2->_semanticStyleRenderingSuspended;
  os_unfair_lock_unlock(p_filterChangeLock);
  return (char)v2;
}

- (int)semanticStyleSceneType
{
  BWStreamingFilterNode *v2;
  os_unfair_lock_s *p_semanticStyleSceneLock;

  v2 = self;
  p_semanticStyleSceneLock = &self->_semanticStyleSceneLock;
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  LODWORD(v2) = v2->_semanticStyleSceneType;
  os_unfair_lock_unlock(p_semanticStyleSceneLock);
  return (int)v2;
}

- (void)setSimulatedAperture:(float)a3
{
  -[BWStreamingCVAFilterRenderer setSimulatedAperture:](self->_streamingCVAFilterRenderer, "setSimulatedAperture:");
  self->_simulatedAperture = a3;
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  -[BWStreamingCVAFilterRenderer setPortraitLightingEffectStrength:](self->_streamingCVAFilterRenderer, "setPortraitLightingEffectStrength:");
  self->_portraitLightingEffectStrength = a3;
}

- (float)portraitLightingEffectStrength
{
  return self->_portraitLightingEffectStrength;
}

- (BWColorLookupCache)colorLookupCache
{
  return self->_colorLookupCache;
}

void __52__BWStreamingFilterNode__changeToFilters_animation___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "prepareWithInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(*(id *)(a1 + 56), "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 64) + 112));
  v3 = *(_QWORD **)(a1 + 64);
  if (v3[17] == *(_QWORD *)(a1 + 72))
  {
    v7 = (void *)v3[19];
LABEL_12:

    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 152) = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 136) = *(_QWORD *)(a1 + 56);
    goto LABEL_13;
  }
  v4 = v3[18];
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "finalRenderList"))
  {
    v6 = *(_QWORD **)(a1 + 64);
LABEL_11:
    v7 = (void *)v6[19];
    goto LABEL_12;
  }
  v5 = *(void **)(a1 + 32);
  if (!v5)
  {
    v6 = *(_QWORD **)(a1 + 64);
    if (v6[17] != v6[18])
      goto LABEL_11;
  }

LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 64) + 112));
}

- (void)setSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4
{
  opaqueCMSampleBuffer *lastSampleBuffer;
  CFTypeRef v8;
  id v9;

  if (self->_multipleSemanticStylesEnabled)
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      -[BWFencedAnimationQueue count](self->_fencedAnimationQueue, "count");
      objc_msgSend(a3, "leftmostRegionStartXOffset");
      objc_msgSend(a4, "port");
      kdebug_trace();
    }
    -[BWFencedAnimationQueue enqueueFencedAnimation:](self->_fencedAnimationQueue, "enqueueFencedAnimation:", +[BWSemanticStyleSetFencedAnimationInfo fencedAnimationInfoWithSemanticStyleSet:fencePortSendRight:](BWSemanticStyleSetFencedAnimationInfo, "fencedAnimationInfoWithSemanticStyleSet:fencePortSendRight:", a3, a4));
    os_unfair_lock_lock(&self->_lastSampleBufferLock);
    lastSampleBuffer = self->_lastSampleBuffer;
    if (lastSampleBuffer)
    {
      v8 = CFRetain(lastSampleBuffer);
      os_unfair_lock_unlock(&self->_lastSampleBufferLock);
      if (v8)
      {
        v9 = +[BWNodeSampleBufferMessage newMessageWithSampleBuffer:](BWNodeSampleBufferMessage, "newMessageWithSampleBuffer:", v8);
        -[BWNodeConnection consumeMessage:fromOutput:](-[BWNodeInput connection](self->super._input, "connection"), "consumeMessage:fromOutput:", v9, -[BWNodeConnection output](-[BWNodeInput connection](self->super._input, "connection"), "output"));

        CFRelease(v8);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lastSampleBufferLock);
    }
  }
  else
  {
    -[BWStreamingFilterNode changeToSemanticStyle:animated:](self, "changeToSemanticStyle:animated:", objc_msgSend(a3, "largestRegionSemanticStyle", a3, a4), 0);
  }
}

- (float)_cubeStrengthForOffset:(uint64_t)a1
{
  float v3;
  float v4;

  if (!a1)
    return 0.0;
  if (a2 > 1.0)
    a2 = 1.0;
  v3 = 0.0;
  if (a2 >= 0.0)
    v4 = a2;
  else
    v4 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 168), "count"))
    return 1.0;
  if (v4 >= 0.05)
  {
    if (v4 >= 0.1)
    {
      if (v4 >= 0.35)
      {
        if (v4 <= 0.65)
        {
          return *(float *)(a1 + 368);
        }
        else
        {
          v3 = 1.0;
          if (v4 < 0.9)
            return (float)((float)((float)((float)(1.0 - v4) + -0.1) * (float)(*(float *)(a1 + 368) + -1.0)) * 4.0)
                 + 1.0;
        }
      }
      else
      {
        return (float)((float)((float)(v4 + -0.1) * (float)(*(float *)(a1 + 368) + -1.0)) * 4.0) + 1.0;
      }
    }
    else
    {
      return (float)(v4 + -0.05) / 0.05;
    }
  }
  return v3;
}

- (void)_updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:(const os_unfair_lock *)a1
{
  uint64_t v3;
  const __CFDictionary *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  int *v15;
  int *v16;
  int *v17;
  int *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  float v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  int *v29;
  int *v30;
  int *v31;
  int *v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  int *v37;
  const void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  CMAttachmentBearerRef target;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];
  _QWORD v62[5];

  v62[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (uint64_t)a1;
    os_unfair_lock_assert_owner(a1 + 88);
    if (a2)
    {
      v4 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
      if (v4)
        CGRectMakeWithDictionaryRepresentation(v4, (CGRect *)(v3 + 288));
    }
    v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "semanticStyles"), "firstObject");
    objc_msgSend(*(id *)(v3 + 280), "regionAtIndex:", 0);
    v7 = v6;
    v9 = v8;
    v10 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 160));
    *(_BYTE *)(v3 + 268) = 1;
    if (v9 == 1.0 && v7 == 0.0 || !*(_QWORD *)(v3 + 120))
    {

      *(_QWORD *)(v3 + 192) = v5;
      -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)v3, 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 160));
    v11 = *(void **)(v3 + 280);
    if (v11 && objc_msgSend((id)objc_msgSend(v11, "semanticStyles"), "count"))
    {
      target = a2;
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(*(id *)(v3 + 280), "largestEdgeOffset");
      v14 = -[BWStreamingFilterNode _cubeStrengthForOffset:](v3, v13);
      v15 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      v16 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      v17 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      v18 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      v19 = 0x1E0C99000;
      if (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "semanticStyles"), "count"))
      {
        v20 = 0;
        v50 = v3;
        do
        {
          v51 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "regions"), "objectAtIndexedSubscript:", v20);
          v21 = v12;
          v22 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "semanticStyles"), "objectAtIndexedSubscript:", v20);
          objc_msgSend(*(id *)(v3 + 280), "regionAtIndex:", v20);
          if (v14 >= 1.0 || v23 < 0.5)
            v25 = v14;
          else
            v25 = 1.0;
          os_unfair_lock_lock((os_unfair_lock_t)(v3 + v10[32]));
          v26 = objc_msgSend(*(id *)(v3 + v15[41]), "filtersForSemanticStyle:sceneType:personSegmentationEnabled:maskVisualizationEnabled:applyStyleBackgroundToEntireFrame:filtersToCombine:", v22, *(unsigned int *)(v3 + 208), *(unsigned __int8 *)(v3 + v16[73]), *(unsigned __int8 *)(v3 + v17[74]), *(unsigned __int8 *)(v3 + 107), *(_QWORD *)(v3 + v18[56]));
          v27 = objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v26);
          os_unfair_lock_unlock((os_unfair_lock_t)(v3 + v10[32]));
          v28 = v15;
          v29 = v16;
          v30 = v17;
          v31 = v18;
          v32 = v10;
          v33 = (void *)MEMORY[0x1E0C99E08];
          v61[0] = 0x1E495A938;
          v61[1] = 0x1E495A958;
          v62[0] = v27;
          v12 = v21;
          v62[1] = v51;
          v19 = 0x1E0C99000uLL;
          v61[2] = 0x1E495A978;
          *(float *)&v34 = v25;
          v62[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
          v35 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
          v36 = v33;
          v10 = v32;
          v18 = v31;
          v17 = v30;
          v16 = v29;
          v15 = v28;
          v3 = v50;
          objc_msgSend(v12, "addObject:", objc_msgSend(v36, "dictionaryWithDictionary:", v35));
          ++v20;
        }
        while (objc_msgSend((id)objc_msgSend(*(id *)(v50 + 280), "semanticStyles"), "count") > v20);
      }
      v37 = v15;
      v38 = target;
      if ((-[BWStreamingFilterNode _hasOverCaptureRegionsWithSampleBuffer:]((CGRect *)v3, target) & 1) != 0)
      {
        v52 = +[FigCaptureSemanticStyle identityStyle](FigCaptureSemanticStyle, "identityStyle");
        os_unfair_lock_lock((os_unfair_lock_t)(v3 + v10[32]));
        v39 = objc_msgSend(*(id *)(v3 + v37[41]), "filtersForSemanticStyle:sceneType:personSegmentationEnabled:maskVisualizationEnabled:applyStyleBackgroundToEntireFrame:filtersToCombine:", v52, *(unsigned int *)(v3 + 208), *(unsigned __int8 *)(v3 + v16[73]), *(unsigned __int8 *)(v3 + v17[74]), 0, *(_QWORD *)(v3 + v18[56]));
        v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v39);
        v53 = 0;
        v54 = 0.0;
        v55 = 0x3FF0000000000000;
        v56 = *(double *)(v3 + 296);
        v41 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v53, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v42 = v17;
        v43 = v12;
        v44 = (void *)MEMORY[0x1E0C99E08];
        v59[0] = 0x1E495A938;
        v59[1] = 0x1E495A958;
        v60[0] = v40;
        v60[1] = v41;
        v45 = objc_msgSend(*(id *)(v19 + 3456), "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
        v46 = v44;
        v12 = v43;
        objc_msgSend(v43, "addObject:", objc_msgSend(v46, "dictionaryWithDictionary:", v45));
        v47 = objc_msgSend(v40, "arrayByAddingObjectsFromArray:", objc_msgSend(*(id *)(v3 + 360), "filtersForSemanticStyle:sceneType:personSegmentationEnabled:maskVisualizationEnabled:applyStyleBackgroundToEntireFrame:filtersToCombine:", v52, *(unsigned int *)(v3 + 208), *(unsigned __int8 *)(v3 + v16[73]), *(unsigned __int8 *)(v3 + v42[74]), 0, *(_QWORD *)(v3 + v18[56])));
        os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 160));
        v53 = 0;
        v54 = *(double *)(v3 + 296) + *(double *)(v3 + 312);
        v55 = 0x3FF0000000000000;
        v56 = 1.0 - v54;
        v48 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v53, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v57[0] = 0x1E495A938;
        v57[1] = 0x1E495A958;
        v10 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
        v58[0] = v47;
        v58[1] = v48;
        v38 = target;
        objc_msgSend(v43, "addObject:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(*(id *)(v19 + 3456), "dictionaryWithObjects:forKeys:count:", v58, v57, 2)));
      }
      -[BWStreamingFilterNode _adjustRectanglesFromFiltersAndRegionArray:withSampleBuffer:](v3, v12, v38);
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + v10[32]));

      *(_QWORD *)(v3 + 272) = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v12);
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + v10[32]));
    }
  }
}

- (CGRect)_hasOverCaptureRegionsWithSampleBuffer:(CGRect *)result
{
  if (result)
  {
    if (target)
      return (CGRect *)(CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D10], 0) != 0);
    else
      return (CGRect *)!CGRectEqualToRect(result[9], result[10]);
  }
  return result;
}

- (uint64_t)_adjustRectanglesFromFiltersAndRegionArray:(CMAttachmentBearerRef)target withSampleBuffer:
{
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (!a1)
    return 0;
  v5 = -[BWStreamingFilterNode _hasOverCaptureRegionsWithSampleBuffer:]((CGRect *)a1, target);
  if (v5)
    v6 = 2;
  else
    v6 = 0;
  v7 = objc_msgSend(a2, "count");
  v8 = v7;
  v9 = v6 | 1;
  v10 = v7 - (v6 | 1);
  if (v7 >= (v6 | 1u))
  {
    v19 = v5;
    v11 = v7 - v6;
    if (v7 != v6)
    {
      v12 = 0;
      if (v11 <= 1)
        v13 = 1;
      else
        v13 = v11;
      do
      {
        v22 = 0u;
        v23 = 0u;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", 0x1E495A958), "getValue:", &v22);
        v14 = *(_QWORD *)(a1 + 312);
        *((_QWORD *)&v22 + 1) = *(_QWORD *)(a1 + 296);
        *((_QWORD *)&v23 + 1) = v14;
        if (v8 == v9)
        {
          *(_QWORD *)&v22 = 0;
          *(_QWORD *)&v23 = 0x3FF0000000000000;
        }
        if (v12)
        {
          if (v10 == v12)
          {
            if (*(double *)&v22 + *(double *)&v23 < 1.0)
              *(double *)&v23 = 1.0 - *(double *)&v22;
            v15 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", (v10 - 1)), "objectForKeyedSubscript:", 0x1E495A958);
            if (v15)
            {
              v20 = 0u;
              v21 = 0u;
              objc_msgSend(v15, "getValue:", &v20);
              *(double *)&v22 = *(double *)&v20 + *(double *)&v21;
              *(double *)&v23 = 1.0 - (*(double *)&v20 + *(double *)&v21);
            }
          }
        }
        else
        {
          if (*(double *)&v22 > 0.0)
          {
            *(double *)&v23 = *(double *)&v22 + *(double *)&v23;
            *(_QWORD *)&v22 = 0;
          }
          if (v8 != v9)
          {
            v16 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", 0x1E495A958);
            if (v16)
            {
              v20 = 0u;
              v21 = 0u;
              objc_msgSend(v16, "getValue:", &v20);
              *(_QWORD *)&v23 = v20;
            }
          }
        }
        objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v12++), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"), 0x1E495A958);
      }
      while (v13 != v12);
    }
    if ((v19 & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v8 - 2), "objectForKeyedSubscript:", 0x1E495A958), "getValue:", &v22);
      *((_QWORD *)&v23 + 1) = *(_QWORD *)(a1 + 296);
      objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v8 - 2), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"), 0x1E495A958);
      v17 = v8 - 1;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v17), "objectForKeyedSubscript:", 0x1E495A958), "getValue:", &v22);
      *((double *)&v22 + 1) = *(double *)(a1 + 296) + *(double *)(a1 + 312);
      *((double *)&v23 + 1) = 1.0 - *((double *)&v22 + 1);
      objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v17), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"), 0x1E495A958);
    }
    return 0;
  }
  return FigSignalErrorAt();
}

- (id)provideStreamingSDOFFilterRenderer
{
  BWStreamingRaytracingSDOFRenderer *streamingRaytracingSDOFRenderer;
  uint64_t v4;
  BWStreamingCVAFilterRenderer *v5;
  uint64_t v7;
  uint64_t v8;

  if (self->_cinematicVideoEnabled)
  {
    streamingRaytracingSDOFRenderer = self->_streamingRaytracingSDOFRenderer;
    if (!streamingRaytracingSDOFRenderer)
    {
      streamingRaytracingSDOFRenderer = -[BWStreamingRaytracingSDOFRenderer initWithCaptureDevice:commandQueue:smartStyleRenderingEnabled:]([BWStreamingRaytracingSDOFRenderer alloc], "initWithCaptureDevice:commandQueue:smartStyleRenderingEnabled:", self->_captureDevice, self->_metalCommandQueue, self->_smartStyleRenderingEnabled);
      self->_streamingRaytracingSDOFRenderer = streamingRaytracingSDOFRenderer;
    }
  }
  else
  {
    streamingRaytracingSDOFRenderer = (BWStreamingRaytracingSDOFRenderer *)self->_streamingCVAFilterRenderer;
    if (!streamingRaytracingSDOFRenderer)
    {
      if (self->_focusBlurMapDeliveryEnabled)
        v4 = 1;
      else
        v4 = 2 * self->_depthFromMonocularNetworkEnabled;
      v5 = [BWStreamingCVAFilterRenderer alloc];
      BYTE4(v8) = self->_secondaryStreamingPersonSegmentationEnabled;
      LODWORD(v8) = self->_rotationDegreesForMetadataAdjustment;
      BYTE4(v7) = self->_mirroredForMetadataAdjustment;
      LODWORD(v7) = self->_priority;
      streamingRaytracingSDOFRenderer = -[BWStreamingCVAFilterRenderer initWithCaptureDevice:studioAndContourRenderingEnabled:stageRenderingEnabled:depthDataSource:foregroundBlurEnabled:commandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:secondaryStreamingPersonSegmentationEnabled:](v5, "initWithCaptureDevice:studioAndContourRenderingEnabled:stageRenderingEnabled:depthDataSource:foregroundBlurEnabled:commandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:secondaryStreamingPersonSegmentationEnabled:", self->_captureDevice, self->_studioAndContourRenderingEnabled, self->_stageRenderingEnabled, v4, self->_portraitPreviewForegroundBlurEnabled, self->_metalCommandQueue, v7, v8);
      self->_streamingCVAFilterRenderer = (BWStreamingCVAFilterRenderer *)streamingRaytracingSDOFRenderer;
    }
  }
  return streamingRaytracingSDOFRenderer;
}

- (id)provideCoreImageFilterRenderer
{
  return -[BWCoreImageFilterRenderer initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:]([BWCoreImageFilterRenderer alloc], "initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:", 0, 0, 0, 0, 0, 14);
}

- (id)provideStillImageMetalSDOFRenderer
{
  return 0;
}

- (id)provideStillImageMetalBlurMapRenderer
{
  return 0;
}

- (id)provideStillImageCoreImageBlurMapRenderer
{
  return 0;
}

- (id)provideApplySmartStyleRenderer
{
  return 0;
}

- (id)provideMetalFilterRenderer
{
  BWMetalColorCubeRenderer *metalFilterRenderer;
  _BOOL4 v4;

  metalFilterRenderer = self->_metalFilterRenderer;
  if (!metalFilterRenderer
    || (v4 = -[BWMetalColorCubeRenderer mixingColorCubesInGammaDomain](metalFilterRenderer, "mixingColorCubesInGammaDomain"), metalFilterRenderer = self->_metalFilterRenderer, self->_mixColorCubesInGammaDomain != v4))
  {

    metalFilterRenderer = -[BWMetalColorCubeRenderer initWithMetalCommandQueue:mixInGammaDomain:]([BWMetalColorCubeRenderer alloc], "initWithMetalCommandQueue:mixInGammaDomain:", self->_metalCommandQueue, self->_mixColorCubesInGammaDomain);
    self->_metalFilterRenderer = metalFilterRenderer;
  }
  return metalFilterRenderer;
}

- (id)provideColorLookupCache
{
  return self->_colorLookupCache;
}

- (void)semanticStyleSceneTypeDidChange:(int)a3
{
  os_unfair_lock_s *p_semanticStyleSceneLock;
  int semanticStyleSceneType;

  p_semanticStyleSceneLock = &self->_semanticStyleSceneLock;
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  semanticStyleSceneType = self->_semanticStyleSceneType;
  self->_semanticStyleSceneType = a3;
  os_unfair_lock_unlock(p_semanticStyleSceneLock);
  if (semanticStyleSceneType != a3)
    -[BWStreamingFilterNode _rebuildSemanticStyleFiltersWithSceneType:]((uint64_t)self);
}

- (BOOL)isRenderingSemanticStyleSet
{
  return self->_renderingSemanticStyleSet;
}

- (BOOL)isStreamingSegmentationFromInferenceEngine
{
  return self->_streamingSegmentationFromInferenceEngine;
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (BOOL)isFocusBlurMapDeliveryEnabled
{
  return self->_focusBlurMapDeliveryEnabled;
}

- (BOOL)isDepthFromMonocularNetworkEnabled
{
  return self->_depthFromMonocularNetworkEnabled;
}

- (BOOL)isPortraitAutoSuggestEnabled
{
  return self->_portraitAutoSuggestEnabled;
}

- (BOOL)isMetadataProcessingEnabled
{
  return self->_metadataProcessingEnabled;
}

- (BOOL)attachesInputPixelBufferAfterRendering
{
  return self->_attachesInputPixelBufferAfterRendering;
}

- (BOOL)studioAndContourRenderingEnabled
{
  return self->_studioAndContourRenderingEnabled;
}

- (BOOL)stageRenderingEnabled
{
  return self->_stageRenderingEnabled;
}

- (BOOL)primaryStreamingPersonSegmentationEnabled
{
  return self->_primaryStreamingPersonSegmentationEnabled;
}

- (void)setPrimaryStreamingPersonSegmentationEnabled:(BOOL)a3
{
  self->_primaryStreamingPersonSegmentationEnabled = a3;
}

- (BOOL)secondaryStreamingPersonSegmentationEnabled
{
  return self->_secondaryStreamingPersonSegmentationEnabled;
}

- (void)setSecondaryStreamingPersonSegmentationEnabled:(BOOL)a3
{
  self->_secondaryStreamingPersonSegmentationEnabled = a3;
}

@end
