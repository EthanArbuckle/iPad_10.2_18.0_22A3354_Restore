@implementation BWBackgroundBlurNode

- (uint64_t)_updateOutputRequirements
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 120), "videoFormat"), "colorSpaceProperties");
    if ((_DWORD)v2)
    {
      v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend((id)objc_msgSend(v1[17], "videoFormat"), "colorSpaceProperties");
    v4 = -[BWBackgroundBlurNode _supportedOutputPixelFormats]((uint64_t)v1);
    v5 = (void *)objc_msgSend(v1[16], "formatRequirements");
    objc_msgSend(v5, "setWidth:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "width"));
    objc_msgSend(v5, "setHeight:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "height"));
    objc_msgSend(v5, "setSupportedColorSpaceProperties:", v3);
    objc_msgSend(v5, "setSupportedPixelFormats:", v4);
    v6 = (void *)objc_msgSend(v1[18], "formatRequirements");
    objc_msgSend(v6, "setWidth:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "width"));
    objc_msgSend(v6, "setHeight:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "height"));
    objc_msgSend(v6, "setSupportedColorSpaceProperties:", v3);
    return objc_msgSend(v6, "setSupportedPixelFormats:", v4);
  }
  return result;
}

BOOL __52__BWBackgroundBlurNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange(objc_msgSend(a2, "intValue"));
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  int *v6;

  if (self->_videoInput == a5)
  {
    v6 = &OBJC_IVAR___BWBackgroundBlurNode__videoOutput;
    goto LABEL_5;
  }
  if (self->_stillImageInput == a5)
  {
    v6 = &OBJC_IVAR___BWBackgroundBlurNode__stillImageOutput;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v6), "makeConfiguredFormatLive", a3, a4);
  }
  self->_previousEffectBypassed = 1;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  int *v7;

  if (objc_msgSend(a4, "passthroughMode"))
  {
    if (self->_videoInput == a4)
    {
      v7 = &OBJC_IVAR___BWBackgroundBlurNode__videoOutput;
      goto LABEL_6;
    }
    if (self->_stillImageInput == a4)
    {
      v7 = &OBJC_IVAR___BWBackgroundBlurNode__stillImageOutput;
LABEL_6:
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *v7), "setFormat:", a3);
    }
  }
  -[BWBackgroundBlurNode _updateOutputRequirements]((uint64_t)self);
}

- (void)setReactionsInProgressChangedHandler:(id)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  id reactionsInProgressObserver;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  reactionsInProgressObserver = self->_reactionsInProgressObserver;
  if (reactionsInProgressObserver)
    _Block_release(reactionsInProgressObserver);
  self->_reactionsInProgressObserver = _Block_copy(a3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeStudioLightingIntensity:(float)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  if (self->_studioLightingIntensity != a3)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    self->_studioLightingIntensity = a3;
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)didChangeGesturesEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  if (self->_gesturesEnabled != a3)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    self->_gesturesEnabled = a3;
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)didChangeBackgroundBlurAperture:(float)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  if (self->_backgroundBlurAperture != a3)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    self->_backgroundBlurAperture = a3;
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_bufferServicingLock;
  int *v9;
  _BOOL4 effectBypassed;
  BOOL v11;
  void *v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  BOOL v15;
  uint64_t v16;
  CVImageBufferRef v17;
  CVImageBufferRef v18;
  void *v19;
  int v20;
  $95D729B680665BEAEFA1D6FCA8238556 *p_framerateThrottleNextPTS;
  Float64 Seconds;
  CMTimeEpoch epoch;
  uint64_t v24;
  OpaqueCMClock *HostTimeClock;
  CMTimeValue value;
  PTEffectRenderRequest *ptEffectRenderRequest;
  unint64_t ActivePTEffect;
  PTEffectRenderRequest *v29;
  __int128 v30;
  double v31;
  double v32;
  id v33;
  id v34;
  CFTypeRef v35;
  CFTypeRef v36;
  CFTypeRef v37;
  CFTypeRef v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  float v45;
  int v46;
  int v47;
  int v48;
  CGSize EncodedSize;
  PTEffectRenderRequest *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  OpaqueCMClock *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  os_unfair_lock_s *v60;
  int maxThermalSystemPressureLevel;
  int v62;
  BWStats *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *key;
  CMTimeValue v76;
  void *v77;
  void *v78;
  __CVBuffer *imageBuffer;
  id v80;
  __CVBuffer *v81;
  CMTime v82;
  CMTime v83;
  CMTime v84;
  CMTime v85;
  _BYTE time[32];
  __int128 v87;
  _BYTE v88[32];
  __int128 v89;
  CMTime v90;
  CMTime v91;
  CMTime v92;
  CMTime v93;
  CMTime v94;
  CMTime lhs;
  CMTime rhs;
  CMTime v97;
  CFTypeRef v98;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v98 = 0;
  if (self->_stillImageInput == a4)
    v9 = &OBJC_IVAR___BWBackgroundBlurNode__stillImageOutput;
  else
    v9 = &OBJC_IVAR___BWBackgroundBlurNode__videoOutput;
  effectBypassed = self->_effectBypassed;
  v11 = !self->_effectBypassed;
  if (!a3)
    goto LABEL_69;
  v12 = *(Class *)((char *)&self->super.super.isa + *v9);
  v13 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v14 = v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_62;
  }
  memset(&v97, 0, sizeof(v97));
  CMTimeMakeFromDictionary(&v97, (CFDictionaryRef)-[__CVBuffer objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  if ((v97.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp((CMTime *)v88, a3);
    v97 = *(CMTime *)v88;
  }
  v81 = v14;
  if (self->_videoInput == a4)
  {
    v17 = CMSampleBufferGetImageBuffer(a3);
    if (v17)
    {
      v18 = v17;
      v80 = a4;
      if (effectBypassed)
      {
        v19 = v12;
        v98 = CFRetain(a3);
        v14 = (__CVBuffer *)CFRetain(v18);
        -[NSMutableArray removeAllObjects](self->_pendingPTEffectReactions, "removeAllObjects");
        v20 = 0;
        effectBypassed = 1;
        goto LABEL_50;
      }
      imageBuffer = v17;
      if (self->_activeBlurEffect != 16)
      {
LABEL_24:
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v91, HostTimeClock);
        CMTimeConvertScale(&v90, &v91, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        value = v90.value;
        ptEffectRenderRequest = self->_ptEffectRenderRequest;
        *(CMTime *)v88 = v97;
        -[PTEffectRenderRequest setFrameTimeSeconds:](ptEffectRenderRequest, "setFrameTimeSeconds:", CMTimeGetSeconds((CMTime *)v88));
        ActivePTEffect = -[BWBackgroundBlurNode _getActivePTEffectTypes]((unint64_t)self);
        if ((ActivePTEffect & 0x10) != 0)
        {
          if (-[NSMutableArray count](self->_pendingPTEffectReactions, "count"))
          {
            -[PTEffectRenderRequest setReactions:](self->_ptEffectRenderRequest, "setReactions:", self->_pendingPTEffectReactions);

            self->_pendingPTEffectReactions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          }
        }
        else
        {
          -[PTEffectRenderRequest setReactions:](self->_ptEffectRenderRequest, "setReactions:", 0);
          -[NSMutableArray removeAllObjects](self->_pendingPTEffectReactions, "removeAllObjects");
        }
        -[PTEffectRenderRequest setEffectType:](self->_ptEffectRenderRequest, "setEffectType:", ActivePTEffect);
        if (-[PTEffect isRenderRequiredForRequest:](self->_ptEffect, "isRenderRequiredForRequest:", self->_ptEffectRenderRequest))
        {
          v14 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v12, "livePixelBufferPool"), "newPixelBuffer");
          if (!v14)
            goto LABEL_62;
          v76 = value;
          -[PTEffectRenderRequest setInColorBuffer:](self->_ptEffectRenderRequest, "setInColorBuffer:", imageBuffer);
          -[PTEffectRenderRequest setOutColorBuffer:](self->_ptEffectRenderRequest, "setOutColorBuffer:", v14);
          -[PTEffectRenderRequest setEffectQuality:](self->_ptEffectRenderRequest, "setEffectQuality:", self->_effectQuality);
          v29 = self->_ptEffectRenderRequest;
          v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)v88 = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v88[16] = v30;
          v89 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          -[PTEffectRenderRequest setTransform:](v29, "setTransform:", v88);
          *(float *)&v31 = self->_backgroundBlurAperture;
          -[PTEffectRenderRequest setApertureSDOF:](self->_ptEffectRenderRequest, "setApertureSDOF:", v31);
          *(float *)&v32 = self->_studioLightingIntensity;
          -[PTEffectRenderRequest setRelightStrengthStudioLight:](self->_ptEffectRenderRequest, "setRelightStrengthStudioLight:", v32);
          -[PTEffectRenderRequest setInBackgroundReplacementBuffer:](self->_ptEffectRenderRequest, "setInBackgroundReplacementBuffer:", self->_backgroundReplacementPixelBuffer);
          v78 = (void *)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
          v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          key = (const __CFString *)*MEMORY[0x1E0D05C08];
          v35 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C08], 0);
          v74 = (const __CFString *)*MEMORY[0x1E0D05C00];
          v36 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C00], 0);
          objc_msgSend(v33, "unionSet:", v35);
          objc_msgSend(v34, "unionSet:", v36);
          v73 = (const __CFString *)*MEMORY[0x1E0D05C50];
          v37 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C50], 0);
          v72 = (const __CFString *)*MEMORY[0x1E0D05C48];
          v38 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C48], 0);
          objc_msgSend(v33, "unionSet:", v37);
          v77 = v34;
          objc_msgSend(v34, "unionSet:", v38);
          if (objc_msgSend(v33, "count") || objc_msgSend(v34, "count"))
          {
            v71 = (id)objc_msgSend(v78, "mutableCopy");
            v70 = *MEMORY[0x1E0D064A0];
            v67 = (id)objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:"), "mutableCopy");
            v69 = *MEMORY[0x1E0D06498];
            v68 = (id)objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:"), "mutableCopy");
            v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v33, "count"));
            v40 = *MEMORY[0x1E0D064D0];
            objc_msgSend(v67, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D064D0]);
            objc_msgSend(v68, "setObject:forKeyedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count")), v40);
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v67, v70);
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v68, v69);
            objc_msgSend(MEMORY[0x1E0D10648], "filterDetectedObjects:usedFaceIDs:usedBodyIDs:filteredObjects:", v78, v33, v77, v71);
            CMRemoveAttachment(a3, key);
            CMRemoveAttachment(a3, v74);
            CMRemoveAttachment(a3, v73);
            CMRemoveAttachment(a3, v72);
            v41 = 1;
            v78 = v71;
          }
          else
          {
            v41 = 0;
          }
          -[PTEffectRenderRequest setFocusOnAll:](self->_ptEffectRenderRequest, "setFocusOnAll:", v41);
          -[PTEffectRenderRequest setDetectedObjects:](self->_ptEffectRenderRequest, "setDetectedObjects:", v78);
          v42 = (const __CFString *)*MEMORY[0x1E0D05C10];
          v43 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C10], 0);
          if (v43)
          {
            v44 = v43;
            objc_msgSend(v43, "floatValue");
            if (v45 > 0.0)
            {
              objc_msgSend(v44, "floatValue");
              -[PTEffectRenderRequest setFocalLength:](self->_ptEffectRenderRequest, "setFocalLength:");
              CMRemoveAttachment(a3, v42);
            }
          }
          if (!self->_upstreamDeviceOrientationCorrectionEnabled
            && !BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue")))
          {
            v46 = -[BWDeviceOrientationMonitor mostRecentPortraitLandscapeOrientation](self->_deviceOrientationMonitor, "mostRecentPortraitLandscapeOrientation");
            v47 = objc_msgSend((id)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), "containsString:", CFSTR("Front"));
            -[BWGraph clientExpectsCameraMountedInLandscapeOrientation](-[BWNode graph](self, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
            v48 = FigCaptureRotationDegreesFromOrientation(v46, v47, 0, 0);
            EncodedSize = CVImageBufferGetEncodedSize(imageBuffer);
            v89 = 0u;
            memset(v88, 0, sizeof(v88));
            FigCaptureMakeMirrorAndRotateVideoTransform((int)EncodedSize.width, (int)EncodedSize.height, 0, v48, (uint64_t)v88);
            v50 = self->_ptEffectRenderRequest;
            *(_OWORD *)time = *(_OWORD *)v88;
            *(_OWORD *)&time[16] = *(_OWORD *)&v88[16];
            v87 = v89;
            -[PTEffectRenderRequest setTransform:](v50, "setTransform:", time);
          }
          v51 = *MEMORY[0x1E0D06C40];
          if (-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]))
            objc_msgSend((id)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", v51), "floatValue");
          else
            LODWORD(v52) = 2143289344;
          -[PTEffectRenderRequest setLuxLevel:](self->_ptEffectRenderRequest, "setLuxLevel:", v52);
          v53 = -[PTEffect render:](self->_ptEffect, "render:", self->_ptEffectRenderRequest);
          if ((_DWORD)v53)
          {
            v16 = v53;
            v15 = 0;
LABEL_72:
            if (self->_videoInput == a4)
            {
              CMSampleBufferGetPresentationTimeStamp(&v82, a3);
              objc_msgSend(v12, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F178, &v82));
            }
            else
            {
              v64 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v16, self, CMGetAttachment(a3, CFSTR("StillSettings"), 0), v81);
              objc_msgSend(v12, "emitNodeError:", v64);

            }
            -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v16, CFSTR("Error : Emitting dropped buffer"), v65, v66);
            if (v15)
              goto LABEL_63;
LABEL_62:
            ++self->_numberOfFramesThatCouldNotBeBlurred;
            goto LABEL_63;
          }
          if (!-[PTEffectRenderRequest outColorBufferWriteSkipped](self->_ptEffectRenderRequest, "outColorBufferWriteSkipped"))
          {
            v19 = v12;
            v54 = CMClockGetHostTimeClock();
            CMClockGetTime(&v85, v54);
            v20 = 1;
            CMTimeConvertScale(&v84, &v85, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            -[BWStats addDataPoint:](self->_backgroundBlurProcessingTimeStats, "addDataPoint:", (double)(v84.value - v76));
            effectBypassed = 0;
LABEL_49:
            v55 = (void *)-[PTEffect activeReactions](self->_ptEffect, "activeReactions");
            CMSampleBufferGetPresentationTimeStamp(&v83, a3);
            -[BWBackgroundBlurNode _updateActiveReactions:currentRenderPTS:requestedTriggers:]((uint64_t)self, v55, (__int128 *)&v83.value, objc_msgSend((id)-[PTEffectRenderRequest reactions](self->_ptEffectRenderRequest, "reactions"), "count"));
LABEL_50:
            v56 = v19;
            if (self->_stillImageCaptureEnabled)
            {
              *(CMTime *)v88 = v97;
              -[BWBackgroundBlurNode _savePixelBufferForStillImageCaptureRequests:withPts:]((CVPixelBufferRef)self, v14, (__int128 *)v88);
            }
            v57 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D088F8], 0);
            if (v57)
            {
              v58 = v57;
              v59 = v20;
              v60 = p_bufferServicingLock;
              maxThermalSystemPressureLevel = self->_maxThermalSystemPressureLevel;
              if (maxThermalSystemPressureLevel <= (int)objc_msgSend(v57, "intValue"))
                v62 = objc_msgSend(v58, "intValue");
              else
                v62 = self->_maxThermalSystemPressureLevel;
              self->_maxThermalSystemPressureLevel = v62;
              p_bufferServicingLock = v60;
              v20 = v59;
            }
            v15 = v20 != 0;
            v11 = !effectBypassed;
            v12 = v56;
            a4 = v80;
            if (v98)
              goto LABEL_58;
            goto LABEL_11;
          }
        }
        else
        {
          v14 = 0;
        }
        v19 = v12;
        v98 = CFRetain(a3);
        CFRetain(imageBuffer);
        if (v14)
          CFRelease(v14);
        v20 = 0;
        effectBypassed = 1;
        v14 = imageBuffer;
        goto LABEL_49;
      }
      if (!objc_msgSend((id)-[PTEffect activeReactions](self->_ptEffect, "activeReactions"), "count"))
      {
        v24 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)&self->_framerateThrottleNextPTS.value = *MEMORY[0x1E0CA2E18];
        self->_framerateThrottleNextPTS.epoch = *(_QWORD *)(v24 + 16);
        goto LABEL_24;
      }
      memset(v88, 0, 24);
      CMTimeMake((CMTime *)v88, 1, 30);
      p_framerateThrottleNextPTS = &self->_framerateThrottleNextPTS;
      if ((self->_framerateThrottleNextPTS.flags & 1) == 0)
      {
        *(_OWORD *)time = *(_OWORD *)v88;
        *(_QWORD *)&time[16] = *(_QWORD *)&v88[16];
        Seconds = CMTimeGetSeconds((CMTime *)time);
        CMTimeMakeWithSeconds(&rhs, Seconds + -0.005, v97.timescale);
        lhs = v97;
        CMTimeAdd((CMTime *)time, &lhs, &rhs);
        *(_OWORD *)&p_framerateThrottleNextPTS->value = *(_OWORD *)time;
        epoch = *(_QWORD *)&time[16];
LABEL_23:
        self->_framerateThrottleNextPTS.epoch = epoch;
        goto LABEL_24;
      }
      *(CMTime *)time = v97;
      *(_OWORD *)&lhs.value = *(_OWORD *)&p_framerateThrottleNextPTS->value;
      lhs.epoch = self->_framerateThrottleNextPTS.epoch;
      if ((CMTimeCompare((CMTime *)time, &lhs) & 0x80000000) == 0)
      {
        memset(time, 0, 24);
        lhs = v97;
        *(_OWORD *)&v94.value = *(_OWORD *)&p_framerateThrottleNextPTS->value;
        v94.epoch = self->_framerateThrottleNextPTS.epoch;
        CMTimeSubtract((CMTime *)time, &lhs, &v94);
        lhs = v97;
        v94 = *(CMTime *)v88;
        CMTimeAdd(&v93, &lhs, &v94);
        lhs = *(CMTime *)time;
        v94 = *(CMTime *)v88;
        CMTimeRemainder();
        CMTimeSubtract(&lhs, &v93, &v92);
        *(_OWORD *)&p_framerateThrottleNextPTS->value = *(_OWORD *)&lhs.value;
        epoch = lhs.epoch;
        goto LABEL_23;
      }
    }
LABEL_69:
    v14 = 0;
    goto LABEL_62;
  }
  *(CMTime *)v88 = v97;
  v14 = (__CVBuffer *)-[BWBackgroundBlurNode _createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:]((uint64_t)self, (__CVBuffer **)v88);
  if (!v14)
  {
    fig_log_get_emitter();
    v66 = v4;
    LODWORD(v65) = 0;
    FigDebugAssert3();
    v15 = 0;
    v16 = 4294954513;
    goto LABEL_72;
  }
  v15 = 1;
LABEL_11:
  BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v14, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&v98);
  if (!v98)
  {
    v16 = 4294954516;
    goto LABEL_72;
  }
LABEL_58:
  objc_msgSend(v12, "emitSampleBuffer:");
  if (!v11 && !self->_previousEffectBypassed)
  {
    -[BWBackgroundBlurNode _reportBackgroundBlurCoreAnalyticsData]((uint64_t)self);
    self->_maxThermalSystemPressureLevel = 0;
    self->_numberOfFramesThatCouldNotBeBlurred = 0;

    v63 = objc_alloc_init(BWStats);
    self->_backgroundBlurProcessingTimeStats = v63;
    -[BWStats setMultiplier:](v63, "setMultiplier:", 0.000001);
    -[BWStats setUnitDesignator:](self->_backgroundBlurProcessingTimeStats, "setUnitDesignator:", CFSTR("ms"));
  }
  self->_previousEffectBypassed = effectBypassed;
  if (!v15)
    goto LABEL_62;
LABEL_63:
  if (v98)
    CFRelease(v98);
  if (v14)
    CFRelease(v14);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (uint64_t)_updateActiveReactions:(__int128 *)a3 currentRenderPTS:(uint64_t)a4 requestedTriggers:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  uint64_t v14;
  _QWORD v15[6];

  if (result)
  {
    v6 = result;
    if (a4
      || (v7 = objc_msgSend(a2, "count"), v7 != objc_msgSend(*(id *)(v6 + 408), "count"))
      || (result = objc_msgSend(a2, "count")) != 0
      && *(_BYTE *)(v6 + 344)
      && (result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 408), "allKeys"), "isEqual:", objc_msgSend(a2, "allKeys")),
          (result & 1) == 0))
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count") + objc_msgSend(*(id *)(v6 + 408), "count"));
      v9 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke;
      v15[3] = &unk_1E4920808;
      v15[4] = v6;
      v15[5] = v8;
      objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v15);
      v10 = *(void **)(v6 + 408);
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke_2;
      v12[3] = &unk_1E4920830;
      v13 = *a3;
      v14 = *((_QWORD *)a3 + 2);
      v12[4] = v8;
      v12[5] = v6;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);
      objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_40);
      v11 = *(_QWORD *)(v6 + 424);
      if (v11)
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);

      result = objc_msgSend(a2, "mutableCopy");
      *(_QWORD *)(v6 + 408) = result;
    }
  }
  return result;
}

- (BWNodeOutput)videoOutput
{
  return self->_videoOutput;
}

- (BWNodeInput)videoInput
{
  return self->_videoInput;
}

- (void)setEffectBypassed:(BOOL)a3
{
  self->_effectBypassed = a3;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)effectBypassed
{
  return self->_effectBypassed;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v3;
  void *v4;
  void *v5;
  const __CFAllocator *v6;
  id v7;
  int v8;
  BWStats *v9;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWBackgroundBlurNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v11, sel_prepareForCurrentConfigurationToBecomeLive);
  formatDescriptionOut = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "newCommandQueue");
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "setGPUPriority:", 4);
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (!CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "pixelFormat"), -[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width"), -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height"), 0, &formatDescriptionOut))
      {
        -[BWDeviceOrientationMonitor start](self->_deviceOrientationMonitor, "start");
        v7 = (id)objc_msgSend(objc_alloc((Class)getPTEffectDescriptorClass()), "init");
        objc_msgSend(v7, "setMetalCommandQueue:", v5);
        objc_msgSend(v7, "setColorSize:", (double)-[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width"), (double)-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height"));
        objc_msgSend(v7, "setExternalDisparitySize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        objc_msgSend(v7, "setAvailableEffectTypes:", self->_availablePTEffects);
        objc_msgSend(v7, "setActiveEffectType:", -[BWBackgroundBlurNode _getActivePTEffectTypes]((unint64_t)self));
        objc_msgSend(v7, "setEffectQuality:", self->_effectQuality);
        objc_msgSend(v7, "setAllowSkipOutColorBufferWrite:", 1);
        objc_msgSend(v7, "setExternalCamera:", self->_deviceType == 15);
        v8 = objc_msgSend(v7, "availableEffectTypes");
        if ((v8 & objc_msgSend(v7, "activeEffectType") & 0x40) != 0)
          objc_msgSend(v7, "setSyncInitialization:", 1);
        self->_ptEffect = (PTEffect *)objc_msgSend(objc_alloc((Class)getPTEffectClass()), "initWithDescriptor:", v7);
        self->_ptEffectRenderRequest = (PTEffectRenderRequest *)objc_msgSend(objc_alloc((Class)getPTEffectRenderRequestClass()), "init");
        if (self->_ptEffect)
        {
          if (!self->_stillImageCaptureEnabled
            || (VTPixelTransferSessionCreate(v6, &self->_stillImagePixelTransferSession),
                self->_stillImagePixelTransferSession))
          {
            v9 = objc_alloc_init(BWStats);
            self->_backgroundBlurProcessingTimeStats = v9;
            -[BWStats setMultiplier:](v9, "setMultiplier:", 0.000001);
            -[BWStats setUnitDesignator:](self->_backgroundBlurProcessingTimeStats, "setUnitDesignator:", CFSTR("ms"));
            self->_numberOfFramesThatCouldNotBeBlurred = 0;
          }
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
}

- (void)_supportedOutputPixelFormats
{
  void *v2;
  int v3;
  char IsFullRange;
  _QWORD v6[4];
  char v7;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[BWBackgroundBlurNode _supportedInputPixelFormats](a1));
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "videoFormat"), "pixelFormat");
  if (v3)
  {
    IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__BWBackgroundBlurNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v6));
  }
  return v2;
}

- (void)_supportedInputPixelFormats
{
  void *v2;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1E49F9288, &unk_1E49F92A0, 0);
  objc_msgSend(v2, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 0, 0, *(_DWORD *)(a1 + 284)));
  return v2;
}

- (void)setEffectQuality:(int64_t)a3
{
  BWDeviceThermalMonitor *thermalMonitor;
  int64_t v6;

  thermalMonitor = self->_thermalMonitor;
  if (thermalMonitor && -[BWDeviceThermalMonitor thermalLevel](thermalMonitor, "thermalLevel") > 1)
  {
    v6 = 100;
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isLowPowerModeEnabled"))
  {
    v6 = 100;
  }
  else
  {
    v6 = a3;
  }
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_effectQuality = v6;
  os_unfair_lock_unlock(&self->_bufferServicingLock);
}

- (void)setActiveBlurEffect:(unint64_t)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_activeBlurEffect = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWBackgroundBlurNode)initWithStillImageCaptureEnabled:(BOOL)a3 maxLossyCompressionLevel:(int)a4 fastSwitchEnabled:(BOOL)a5 availableEffects:(unint64_t)a6 activeEffect:(unint64_t)a7 isHighQualitySupported:(BOOL)a8 upstreamDeviceOrientationCorrectionEnabled:(BOOL)a9 deviceType:(int)a10
{
  _BOOL4 v15;
  BWBackgroundBlurNode *v16;
  uint64_t v17;
  BWVideoFormatRequirements *v18;
  BWVideoFormatRequirements *v19;
  BWVideoFormatRequirements *v20;
  BWVideoFormatRequirements *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _OWORD *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v15 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BWBackgroundBlurNode;
  v16 = -[BWNode init](&v30, sel_init);
  v17 = (uint64_t)v16;
  if (v16)
  {
    v16->_fastSwitchEnabled = a5;
    v16->_videoInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v16, 0);
    v18 = objc_alloc_init(BWVideoFormatRequirements);
    *(_DWORD *)(v17 + 236) = 0;
    *(_DWORD *)(v17 + 284) = a4;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v18, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedInputPixelFormats](v17));
    objc_msgSend(*(id *)(v17 + 120), "setFormatRequirements:", v18);
    objc_msgSend(*(id *)(v17 + 120), "setPassthroughMode:", 2);
    objc_msgSend(*(id *)(v17 + 120), "setRetainedBufferCount:", 1);
    objc_msgSend((id)v17, "addInput:", *(_QWORD *)(v17 + 120));
    *(_QWORD *)(v17 + 128) = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v17);
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v19, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedOutputPixelFormats](v17));
    objc_msgSend(*(id *)(v17 + 128), "setFormatRequirements:", v19);
    objc_msgSend(*(id *)(v17 + 128), "setPassthroughMode:", 2);
    objc_msgSend(*(id *)(v17 + 128), "setProvidesPixelBufferPool:", 1);
    objc_msgSend((id)objc_msgSend(*(id *)(v17 + 128), "primaryMediaConfiguration"), "setOwningNodeRetainedBufferCount:", 2);
    objc_msgSend(*(id *)(v17 + 128), "setIndexOfInputWhichDrivesThisOutput:", 0);
    objc_msgSend((id)v17, "addOutput:", *(_QWORD *)(v17 + 128));
    *(_BYTE *)(v17 + 152) = v15;
    if (v15)
    {
      objc_msgSend(*(id *)(v17 + 120), "setRetainedBufferCount:", objc_msgSend(*(id *)(v17 + 120), "retainedBufferCount") + 1);
      objc_msgSend(*(id *)(v17 + 120), "setIndefinitelyHeldBufferCount:", objc_msgSend(*(id *)(v17 + 120), "indefinitelyHeldBufferCount") + 1);
      *(_QWORD *)(v17 + 136) = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v17, 1);
      v20 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedInputPixelFormats](v17));
      objc_msgSend(*(id *)(v17 + 136), "setFormatRequirements:", v20);
      objc_msgSend(*(id *)(v17 + 136), "setPassthroughMode:", 0);
      objc_msgSend((id)v17, "addInput:", *(_QWORD *)(v17 + 136));
      *(_QWORD *)(v17 + 144) = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v17);
      v21 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedOutputPixelFormats](v17));
      objc_msgSend(*(id *)(v17 + 144), "setFormatRequirements:", v21);
      objc_msgSend(*(id *)(v17 + 144), "setPassthroughMode:", 0);
      objc_msgSend((id)objc_msgSend(*(id *)(v17 + 144), "primaryMediaConfiguration"), "setProvidesPixelBufferPool:", 1);
      objc_msgSend(*(id *)(v17 + 144), "setIndexOfInputWhichDrivesThisOutput:", 1);
      objc_msgSend((id)v17, "addOutput:", *(_QWORD *)(v17 + 144));
      *(_OWORD *)(v17 + 168) = 0u;
      *(_OWORD *)(v17 + 184) = 0u;
      *(_OWORD *)(v17 + 200) = 0u;
      *(_OWORD *)(v17 + 216) = 0u;
      *(_DWORD *)(v17 + 232) = 0;
    }
    *(_QWORD *)(v17 + 304) = (2 * (int)a6) & 0x20 | a6;
    objc_msgSend((id)v17, "setActiveBlurEffect:", a7);
    *(_BYTE *)(v17 + 288) = a8;
    *(_BYTE *)(v17 + 312) = a9;
    *(_QWORD *)(v17 + 320) = objc_alloc_init(BWDeviceOrientationMonitor);
    *(_QWORD *)(v17 + 456) = objc_alloc_init(BWDeviceThermalMonitor);
    if (*(_BYTE *)(v17 + 288))
      v22 = 110;
    else
      v22 = 100;
    objc_msgSend((id)v17, "setEffectQuality:", v22);
    objc_initWeak(&location, (id)v17);
    v23 = *(void **)(v17 + 456);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __207__BWBackgroundBlurNode_initWithStillImageCaptureEnabled_maxLossyCompressionLevel_fastSwitchEnabled_availableEffects_activeEffect_isHighQualitySupported_upstreamDeviceOrientationCorrectionEnabled_deviceType___block_invoke;
    v27[3] = &unk_1E49207E0;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v23, "setThermalHandler:", v27);
    v24 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v24, "addObserver:selector:name:object:", v17, sel_lowPowerModeChanged_, *MEMORY[0x1E0CB3048], 0);
    *(_DWORD *)(v17 + 336) = 1077936128;
    *(_DWORD *)(v17 + 340) = 1056964608;
    *(_BYTE *)(v17 + 344) = 0;
    *(_QWORD *)(v17 + 352) = 0;
    *(_QWORD *)(v17 + 360) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = (_OWORD *)MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v17 + 448) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)(v17 + 432) = *v25;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return (BWBackgroundBlurNode *)v17;
}

id __207__BWBackgroundBlurNode_initWithStillImageCaptureEnabled_maxLossyCompressionLevel_fastSwitchEnabled_availableEffects_activeEffect_isHighQualitySupported_upstreamDeviceOrientationCorrectionEnabled_deviceType___block_invoke(uint64_t a1, void *a2)
{
  id result;
  void *v4;

  result = objc_loadWeak((id *)(a1 + 32));
  if (a2)
  {
    v4 = result;
    if (result)
    {
      result = (id)objc_msgSend(a2, "thermalLevel");
      if ((int)result >= 2)
        return (id)objc_msgSend(v4, "setEffectQuality:", 100);
    }
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  uint64_t v4;
  char v5;
  char v6;
  __CVBuffer *pixelBuffer;
  OpaqueVTPixelTransferSession *stillImagePixelTransferSession;
  id reactionsInProgressObserver;
  void *v10;
  objc_super v11;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  if (self->_stillImageCaptureEnabled)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      pixelBuffer = self->_stillCaptureQueue[v4].pixelBuffer;
      if (pixelBuffer)
        CFRelease(pixelBuffer);
      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
  stillImagePixelTransferSession = self->_stillImagePixelTransferSession;
  if (stillImagePixelTransferSession)
    CFRelease(stillImagePixelTransferSession);

  reactionsInProgressObserver = self->_reactionsInProgressObserver;
  if (reactionsInProgressObserver)
    _Block_release(reactionsInProgressObserver);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3048], 0);

  v11.receiver = self;
  v11.super_class = (Class)BWBackgroundBlurNode;
  -[BWNode dealloc](&v11, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("BackgroundBlurNode");
}

- (unint64_t)_getActivePTEffectTypes
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;

  if (result)
  {
    v1 = *(_QWORD *)(result + 296);
    if ((v1 & 0x10) != 0 && *(_BYTE *)(result + 344))
      v2 = v1 | 0x20;
    else
      v2 = v1 & 0xFFFFFFFFFFFFFFDFLL;
    if (*(_QWORD *)(result + 352))
      v3 = 1;
    else
      v3 = (v2 & 0x40) == 0;
    if (v3)
      return v2;
    else
      return v2 & 0xFFFFFFFFFFFFFFBFLL;
  }
  return result;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (!self->_effectBypassed)
    -[BWBackgroundBlurNode _reportBackgroundBlurCoreAnalyticsData]((uint64_t)self);
  -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
  if (self->_videoInput == a3)
  {
    -[BWNodeOutput markEndOfLiveOutput](self->_videoOutput, "markEndOfLiveOutput");
    -[BWDeviceOrientationMonitor stop](self->_deviceOrientationMonitor, "stop");
  }
  if (self->_stillImageInput == a3)
    -[BWNodeOutput markEndOfLiveOutput](self->_stillImageOutput, "markEndOfLiveOutput");
}

- (uint64_t)_reportBackgroundBlurCoreAnalyticsData
{
  uint64_t v1;
  BWBackgroundBlurSessionAnalyticsPayload *v2;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(BWBackgroundBlurSessionAnalyticsPayload);
    -[BWBackgroundBlurSessionAnalyticsPayload setClientApplicationID:](v2, "setClientApplicationID:", *(_QWORD *)(v1 + 248));
    -[BWBackgroundBlurSessionAnalyticsPayload setEffectQuality:](v2, "setEffectQuality:", *(_QWORD *)(v1 + 464));
    objc_msgSend(*(id *)(v1 + 264), "average");
    -[BWBackgroundBlurSessionAnalyticsPayload setAverageProcessingTime:](v2, "setAverageProcessingTime:");
    objc_msgSend(*(id *)(v1 + 264), "max");
    -[BWBackgroundBlurSessionAnalyticsPayload setMaxProcessingTime:](v2, "setMaxProcessingTime:");
    -[BWBackgroundBlurSessionAnalyticsPayload setNumberOfFrames:](v2, "setNumberOfFrames:", objc_msgSend(*(id *)(v1 + 264), "numberOfSamples"));
    -[BWBackgroundBlurSessionAnalyticsPayload setNumberOfFrameDrops:](v2, "setNumberOfFrameDrops:", *(unsigned int *)(v1 + 272));
    -[BWBackgroundBlurSessionAnalyticsPayload setMaxThermalSystemPressureLevel:](v2, "setMaxThermalSystemPressureLevel:", *(unsigned int *)(v1 + 276));
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v2);
  }
  return result;
}

- (CVPixelBufferRef)_savePixelBufferForStillImageCaptureRequests:(__int128 *)a3 withPts:
{
  CVPixelBufferRef v5;
  __CVBuffer *v6;
  uint64_t v7;
  int v8;
  int v9;
  __int128 v10;
  uint64_t v11;

  if (result)
  {
    v5 = result;
    v6 = (__CVBuffer *)*((_QWORD *)result + 4 * *((unsigned int *)result + 58) + 21);
    if (v6)
      CVPixelBufferRelease(v6);
    v10 = *a3;
    v11 = *((_QWORD *)a3 + 2);
    result = CVPixelBufferRetain(texture);
    v7 = (uint64_t)v5 + 32 * *((unsigned int *)v5 + 58) + 168;
    *(_QWORD *)v7 = result;
    *(_QWORD *)(v7 + 24) = v11;
    *(_OWORD *)(v7 + 8) = v10;
    v8 = *((_DWORD *)v5 + 58);
    if (v8 == 1)
      v9 = 0;
    else
      v9 = v8 + 1;
    *((_DWORD *)v5 + 58) = v9;
  }
  return result;
}

- (void)_createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:(uint64_t)a1
{
  uint64_t v3;
  __CVBuffer *v4;
  __CVBuffer *v5;
  unint64_t v6;
  char v7;
  char v8;
  __CVBuffer **v9;
  __CVBuffer *v10;
  __CVBuffer *v11;
  uint64_t v12;

  if (a1)
  {
    v3 = 0;
    v4 = 0;
    v5 = *a2;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 1;
    while (1)
    {
      v8 = v7;
      v9 = (__CVBuffer **)(a1 + 168 + 32 * v3);
      v11 = *v9;
      v10 = v9[1];
      v12 = v5 - v10;
      if (v5 == v10)
        break;
      v7 = 0;
      if (v12 < 0)
        v12 = -v12;
      if (v6 > v12)
        v4 = v11;
      if (v6 >= v12)
        v6 = v12;
      v3 = 1;
      if ((v8 & 1) == 0)
      {
        if (!v4)
          return 0;
        return -[BWBackgroundBlurNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
      }
    }
    v4 = v11;
    if (v11)
      return -[BWBackgroundBlurNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
  }
  return 0;
}

- (unint64_t)activeBlurEffect
{
  return self->_activeBlurEffect;
}

- (void)_newStillImageOutputPixelBufferFromVideoPixelBuffer:(uint64_t)a1
{
  void *v3;

  if (!a1)
    return 0;
  v3 = 0;
  if (a2)
  {
    if (*(_QWORD *)(a1 + 160))
    {
      v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 144), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
      if (v3)
      {
        if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 160), a2, (CVPixelBufferRef)v3))
        {
          CFRelease(v3);
          return 0;
        }
      }
    }
  }
  return v3;
}

uint64_t __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "removeObjectForKey:", a2);
  result = bbn_StringForPTEffectReactionType(objc_msgSend(a3, "effectType"));
  if (result)
  {
    v6 = *(void **)(a1 + 40);
    v8[0] = CFSTR("ReactionType");
    v8[1] = CFSTR("StartTime");
    v9[0] = result;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "startTime");
    v9[1] = objc_msgSend(v7, "numberWithDouble:");
    return objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  }
  return result;
}

uint64_t __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v6;
  void *v7;
  void *v8;
  BWReactionAnalyticsPayload *v9;
  CMTime v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  result = bbn_StringForPTEffectReactionType(objc_msgSend(a3, "effectType"));
  if (result)
  {
    v6 = result;
    v7 = *(void **)(a1 + 32);
    v12[0] = result;
    v11[0] = CFSTR("ReactionType");
    v11[1] = CFSTR("StartTime");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "startTime");
    v12[1] = objc_msgSend(v8, "numberWithDouble:");
    v11[2] = CFSTR("EndTime");
    v10 = *(CMTime *)(a1 + 48);
    v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v10));
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    v9 = objc_alloc_init(BWReactionAnalyticsPayload);
    -[BWReactionAnalyticsPayload setReactionType:](v9, "setReactionType:", v6);
    -[BWReactionAnalyticsPayload setUiTriggeredReaction:](v9, "setUiTriggeredReaction:", objc_msgSend(a3, "uiTriggeredReaction"));
    -[BWReactionAnalyticsPayload setClientApplicationID:](v9, "setClientApplicationID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248));
    -[BWReactionAnalyticsPayload setContinuityCameraClientDeviceClass:](v9, "setContinuityCameraClientDeviceClass:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 256));
    result = -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v9);
    ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 376);
  }
  return result;
}

uint64_t __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("StartTime")), "compare:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StartTime")));
}

- (void)didChangePortraitEffectStudioLightQuality:(int64_t)a3
{
  if (self->_ptEffect)
  {
    if (self->_effectQuality != a3)
      -[BWBackgroundBlurNode setEffectQuality:](self, "setEffectQuality:");
  }
}

- (void)performReactionEffect:(id)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  int64_t reactionCounterAPI;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (bbn_PTEffectReactionTypeForString_onceToken != -1)
    dispatch_once(&bbn_PTEffectReactionTypeForString_onceToken, &__block_literal_global_254);
  v6 = (void *)objc_msgSend((id)bbn_PTEffectReactionTypeForString_sMapNameToReactionType, "objectForKeyedSubscript:", a3);
  if (v6 && (v7 = objc_msgSend(v6, "unsignedIntegerValue"), v7 <= 7))
  {
    v8 = v7;
    v9 = objc_alloc_init((Class)getPTEffectReactionClass());
    objc_msgSend(v9, "setEffectType:", v8);
    objc_msgSend(v9, "setUiTriggeredReaction:", 1);
    reactionCounterAPI = self->_reactionCounterAPI;
    self->_reactionCounterAPI = reactionCounterAPI + 1;
    objc_msgSend(v9, "setTriggerID:", ~reactionCounterAPI);
    -[NSMutableArray addObject:](self->_pendingPTEffectReactions, "addObject:", v9);
  }
  else
  {
    v9 = 0;
  }

  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (unsigned)reactionCount
{
  return self->_reactionCounterAll;
}

- (void)didChangeBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  __CVBuffer *backgroundReplacementPixelBuffer;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  self->_backgroundReplacementPixelBuffer = a3;
  if (a3)
    CFRetain(a3);
  if (backgroundReplacementPixelBuffer)
    CFRelease(backgroundReplacementPixelBuffer);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)lowPowerModeChanged:(id)a3
{
  void *v4;
  BWBackgroundBlurNode *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a3, "name");
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB3048]))
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isLowPowerModeEnabled"))
    {
      v5 = self;
      v6 = 100;
    }
    else
    {
      if (!self->_isHighQualityEffectSupported)
        return;
      v5 = self;
      v6 = 110;
    }
    -[BWBackgroundBlurNode setEffectQuality:](v5, "setEffectQuality:", v6);
  }
}

- (BWNodeInput)stillImageInput
{
  return self->_stillImageInput;
}

- (BWNodeOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_continuityCameraClientDeviceClass = a3;
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

@end
