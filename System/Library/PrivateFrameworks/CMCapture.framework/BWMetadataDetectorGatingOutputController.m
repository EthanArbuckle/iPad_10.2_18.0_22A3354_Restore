@implementation BWMetadataDetectorGatingOutputController

- (void)enableDetectionFrameRateControllingWithRamp:(id)a3 startIndex:(char)a4
{

  self->_detectionFrameRateRamp = (NSArray *)a3;
  self->_detectionFrameRateRampStartIndex = a4;
  self->_detectionFrameRateRampIndex = a4;
}

- (BOOL)usesSceneClassifierToGateDetection
{
  return self->_usesSceneClassifierToGateDetection;
}

- (void)setUsesSceneClassifierToGateDetection:(BOOL)a3
{
  self->_usesSceneClassifierToGateDetection = a3;
}

- (void)setLogger:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (FigCaptureLogSmartCameraGating)logger
{
  return self->_logger;
}

- (void)prepareToEmitBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTime *p_currentPTS;
  _BOOL4 sceneLikelyToHaveCodes;
  uint64_t detectionFrameRateRampIndex;
  int32_t v7;
  int v8;
  BWSceneStabilityMonitor *sceneStabilityMonitor;
  _BOOL4 v10;
  int v11;
  NSArray *detectionFrameRateRamp;
  double v13;
  BOOL sceneMotionEstimatesSupported;
  $95D729B680665BEAEFA1D6FCA8238556 lastDetectionPTS;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime time;
  CMTime time2;
  CMTime rhs;
  CMTime time1;
  CMTime lhs;

  p_currentPTS = (CMTime *)&self->_currentPTS;
  BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&lhs);
  self->_currentPTS = ($95D729B680665BEAEFA1D6FCA8238556)lhs;
  self->_isHandlingFirstBufferAfterSceneChange = 0;
  os_unfair_lock_lock(&self->_lock);
  sceneLikelyToHaveCodes = self->_sceneLikelyToHaveCodes;
  if (!self->_emittedFirstBufferAfterSceneChange)
  {
    self->_isHandlingFirstBufferAfterSceneChange = 1;
    self->_firstBufferAfterSceneChangeHasCodes = sceneLikelyToHaveCodes;
    self->_emittedFirstBufferAfterSceneChange = 1;
  }
  detectionFrameRateRampIndex = self->_detectionFrameRateRampIndex;
  lhs = *p_currentPTS;
  rhs = (CMTime)self->_detectedCodesLastSeenPTS;
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTimeMakeWithSeconds(&time2, 0.667, 1000);
  v7 = CMTimeCompare(&time1, &time2);
  os_unfair_lock_unlock(&self->_lock);
  v8 = !self->_usesSceneClassifierToGateDetection || sceneLikelyToHaveCodes;
  memset(&lhs, 0, sizeof(lhs));
  CMTimeMakeWithSeconds(&lhs, 0.0667, 1000);
  if (v7 < 0)
  {
    time = lhs;
    CMTimeMultiplyByRatio(&rhs, &time, 1, 3);
    lhs = rhs;
  }
  memset(&rhs, 0, sizeof(rhs));
  sceneStabilityMonitor = self->_sceneStabilityMonitor;
  if (sceneStabilityMonitor)
    -[BWSceneStabilityMonitor stableStartTime](sceneStabilityMonitor, "stableStartTime");
  else
    memset(&v19, 0, sizeof(v19));
  time = *p_currentPTS;
  CMTimeSubtract(&rhs, &time, &v19);
  if (self->_isHandlingFirstBufferAfterSceneChange)
  {
    v10 = 1;
  }
  else
  {
    time = rhs;
    v18 = lhs;
    v10 = CMTimeCompare(&time, &v18) > 0;
  }
  v11 = v10 & v8;
  detectionFrameRateRamp = self->_detectionFrameRateRamp;
  if (detectionFrameRateRamp)
  {
    if ((self->_currentPTS.flags & 1) != 0 && (self->_lastDetectionPTS.flags & 1) != 0)
    {
      memset(&time, 0, sizeof(time));
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](detectionFrameRateRamp, "objectAtIndexedSubscript:", detectionFrameRateRampIndex), "doubleValue");
      CMTimeMakeWithSeconds(&time, 1.0 / v13, 1000);
      v18 = *p_currentPTS;
      lastDetectionPTS = self->_lastDetectionPTS;
      CMTimeSubtract(&v17, &v18, (CMTime *)&lastDetectionPTS);
      v18 = time;
      if (CMTimeCompare(&v17, &v18) <= 0)
        v11 = 0;
    }
  }
  self->_shouldRunDetection = v11;
  if (v11 && dispatch_group_wait((dispatch_group_t)self->_detectorAvailableGroup, 0))
    self->_shouldRunDetection = 0;
  sceneMotionEstimatesSupported = self->_sceneMotionEstimatesSupported;
  if (sceneMotionEstimatesSupported)
  {
    if (self->_lowPowerModeEnabled)
      sceneMotionEstimatesSupported = 0;
    else
      sceneMotionEstimatesSupported = self->_shouldRunDetection || v7 < 0;
  }
  self->_shouldApplySceneMotion = sceneMotionEstimatesSupported;
}

- (BOOL)shouldApplySceneMotion
{
  return self->_shouldApplySceneMotion;
}

- (BOOL)shouldEmitBuffer
{
  BOOL v3;

  v3 = self->_sceneMotionEstimatesSupported
    && -[BWSceneStabilityMonitor processedSceneMotion](self->_sceneStabilityMonitor, "processedSceneMotion");
  if (-[BWMetadataDetectorGatingOutputController shouldRunDetection](self, "shouldRunDetection")
    || -[BWMetadataDetectorGatingOutputController shouldEmitFirstBufferAfterSceneChange](self, "shouldEmitFirstBufferAfterSceneChange")&& -[BWMetadataDetectorGatingOutputController isHandlingFirstBufferAfterSceneChange](self, "isHandlingFirstBufferAfterSceneChange"))
  {
    return 1;
  }
  return v3;
}

- (BOOL)shouldRunDetection
{
  return self->_shouldRunDetection;
}

- (BOOL)shouldEmitFirstBufferAfterSceneChange
{
  return self->_shouldEmitFirstBufferAfterSceneChange;
}

- (BOOL)isHandlingFirstBufferAfterSceneChange
{
  return self->_isHandlingFirstBufferAfterSceneChange;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (BWMetadataDetectorGatingOutputController)initWithOutput:(id)a3 name:(id)a4 sceneStabilityMonitor:(id)a5 detectorAvailableGroup:(id)a6
{
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BWMetadataDetectorGatingOutputController;
  v10 = -[BWMetadataDetectorGatingOutputController init](&v16, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 2) = a3;
    *((_QWORD *)v10 + 1) = objc_msgSend(a4, "copy");
    *((_QWORD *)v10 + 12) = a5;
    *((_DWORD *)v10 + 43) = 0;
    v11 = MEMORY[0x1E0CA2E18];
    v12 = *MEMORY[0x1E0CA2E18];
    *((_OWORD *)v10 + 2) = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(v11 + 16);
    *((_QWORD *)v10 + 6) = v13;
    *(_OWORD *)(v10 + 56) = v12;
    *((_QWORD *)v10 + 9) = v13;
    v14 = MEMORY[0x1E0CA2E68];
    *((_OWORD *)v10 + 9) = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)v10 + 20) = *(_QWORD *)(v14 + 16);
    v10[129] = 1;
    *((_QWORD *)v10 + 15) = a6;
  }
  return (BWMetadataDetectorGatingOutputController *)v10;
}

- (void)setSynchronizeWithOtherControllers:(BOOL)a3
{
  self->_synchronizeWithOtherControllers = a3;
}

- (void)setShouldEmitFirstBufferAfterSceneChange:(BOOL)a3
{
  self->_shouldEmitFirstBufferAfterSceneChange = a3;
}

- (void)setSceneMotionEstimatesSupported:(BOOL)a3
{
  self->_sceneMotionEstimatesSupported = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMetadataDetectorGatingOutputController;
  -[BWMetadataDetectorGatingOutputController dealloc](&v3, sel_dealloc);
}

- (void)setSmartCameraSceneConfident:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isSmartCameraSceneConfident != v3)
  {
    self->_isSmartCameraSceneConfident = v3;
    -[BWMetadataDetectorGatingOutputController _updateSceneLikelyToHaveCodes]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateSceneLikelyToHaveCodes
{
  uint64_t v2;
  int v3;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 172));
    if (*(_BYTE *)(a1 + 24))
    {
      if (*(_BYTE *)(a1 + 130))
      {
        if (!*(_BYTE *)(a1 + 128))
        {
          *(_WORD *)(a1 + 128) = 1;
LABEL_9:
          objc_msgSend(*(id *)(a1 + 112), "logGateOpened");
        }
      }
      else
      {
        v2 = *(_QWORD *)(a1 + 136);
        v3 = v2 > 0;
        if (*(unsigned __int8 *)(a1 + 128) != v3)
        {
          *(_WORD *)(a1 + 128) = v3;
          if (v2 >= 1)
            goto LABEL_9;
          objc_msgSend(*(id *)(a1 + 112), "logGateClosed");
        }
      }
    }
  }
}

- (BOOL)isSmartCameraSceneConfident
{
  BWMetadataDetectorGatingOutputController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isSmartCameraSceneConfident;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLastDetectedCodesCount:(int64_t)a3 originalPTS:(id *)a4
{
  os_unfair_lock_s *p_lock;
  int64_t lastDetectedCodesCount;
  __int128 v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastDetectedCodesCount = self->_lastDetectedCodesCount;
  if (lastDetectedCodesCount != a3)
  {
    if (lastDetectedCodesCount < a3 && self->_synchronizeWithOtherControllers)
      self->_forceSynchronizedControllersToRunDetectionImmediately = 1;
    self->_lastDetectedCodesCount = a3;
    -[BWMetadataDetectorGatingOutputController _updateSceneLikelyToHaveCodes]((uint64_t)self);
    a3 = self->_lastDetectedCodesCount;
  }
  if (a3 >= 1)
  {
    self->_detectionFrameRateRampIndex = 0;
    v10 = *(_OWORD *)&a4->var0;
    self->_detectedCodesLastSeenPTS.epoch = a4->var3;
    *(_OWORD *)&self->_detectedCodesLastSeenPTS.value = v10;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)lastDetectedCodesCount
{
  os_unfair_lock_s *p_lock;
  int64_t lastDetectedCodesCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastDetectedCodesCount = self->_lastDetectedCodesCount;
  os_unfair_lock_unlock(p_lock);
  return lastDetectedCodesCount;
}

- (void)setForceSynchronizedControllersToRunDetectionImmediately:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_forceSynchronizedControllersToRunDetectionImmediately = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)forceSynchronizedControllersToRunDetectionImmediately
{
  BWMetadataDetectorGatingOutputController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_forceSynchronizedControllersToRunDetectionImmediately;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)emitPixelBuffer:(__CVBuffer *)a3 inputSampleBuffer:(opaqueCMSampleBuffer *)a4 appliedPrimaryCaptureRect:(BOOL)a5
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  _BOOL4 shouldRunDetection;
  BWSceneStabilityMonitor *sceneStabilityMonitor;
  unint64_t detectionFrameRateRampIndex;
  NSUInteger v11;
  CMTime time2;
  CMTime lhs;
  CMTime rhs;
  CMTime v15;

  v6 = -[BWMetadataDetectorGatingOutputController _newOutputSampleBufferWithPixelBuffer:inputSampleBuffer:appliedPrimaryCaptureRect:]((unsigned __int8 *)self, a3, a4, a5);
  if (v6)
  {
    v7 = v6;
    -[BWNodeOutput emitSampleBuffer:](self->_nodeOutput, "emitSampleBuffer:", v6);
    shouldRunDetection = self->_shouldRunDetection;
    if (self->_shouldRunDetection)
    {
      *(_OWORD *)&self->_lastDetectionPTS.value = *(_OWORD *)&self->_currentPTS.value;
      self->_lastDetectionPTS.epoch = self->_currentPTS.epoch;
    }
    os_unfair_lock_lock(&self->_lock);
    memset(&v15, 0, sizeof(v15));
    sceneStabilityMonitor = self->_sceneStabilityMonitor;
    if (sceneStabilityMonitor)
      -[BWSceneStabilityMonitor unstableStartTime](sceneStabilityMonitor, "unstableStartTime");
    else
      memset(&rhs, 0, sizeof(rhs));
    lhs = (CMTime)self->_currentPTS;
    CMTimeSubtract(&v15, &lhs, &rhs);
    if ((self->_lowPowerModeEnabled || -[BWSceneStabilityMonitor isStable](self->_sceneStabilityMonitor, "isStable"))
      && (-[BWSceneStabilityMonitor isStable](self->_sceneStabilityMonitor, "isStable")
       || (CMTimeMake(&time2, 300, 1000), lhs = v15, CMTimeCompare(&lhs, &time2) < 1))
      && (shouldRunDetection || !self->_isHandlingFirstBufferAfterSceneChange)
      && !-[BWSceneStabilityMonitor isAFCompleted](self->_sceneStabilityMonitor, "isAFCompleted"))
    {
      if (!shouldRunDetection)
        goto LABEL_16;
      ++self->_detectionFrameRateRampIndex;
      if (-[NSArray count](self->_detectionFrameRateRamp, "count") - 1 < self->_detectionFrameRateRampIndex)
        -[NSArray count](self->_detectionFrameRateRamp, "count");
      v11 = -[NSArray count](self->_detectionFrameRateRamp, "count");
      detectionFrameRateRampIndex = self->_detectionFrameRateRampIndex;
      if (v11 - 1 < detectionFrameRateRampIndex)
        LOBYTE(detectionFrameRateRampIndex) = -[NSArray count](self->_detectionFrameRateRamp, "count") - 1;
    }
    else
    {
      LOBYTE(detectionFrameRateRampIndex) = self->_detectionFrameRateRampStartIndex;
    }
    self->_detectionFrameRateRampIndex = detectionFrameRateRampIndex;
LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
    CFRelease(v7);
  }
}

- (unsigned)_newOutputSampleBufferWithPixelBuffer:(opaqueCMSampleBuffer *)a3 inputSampleBuffer:(int)a4 appliedPrimaryCaptureRect:
{
  unsigned __int8 *v5;
  CMAttachmentBearerRef v6;
  const __CFString *v7;
  void *v8;
  CMAttachmentBearerRef v9;
  const __CFString *v10;
  void *v11;
  CFTypeRef cf;
  CMAttachmentBearerRef target;

  if (result)
  {
    v5 = result;
    cf = 0;
    target = 0;
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, a2, &cf, (CMSampleBufferRef *)&target))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      if (a4)
        CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D10], 0, 1u);
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D38], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5[104]), 1u);
      if (v5[104])
        CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C40], *((CFTypeRef *)v5 + 15), 1u);
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D78], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*((id *)v5 + 12), "isStable")), 1u);
      if (v5[26] && objc_msgSend(*((id *)v5 + 12), "processedSceneMotion"))
      {
        v6 = target;
        v7 = (const __CFString *)*MEMORY[0x1E0D05D60];
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*((id *)v5 + 12), "sceneMotionOffsetX");
        CMSetAttachment(v6, v7, (CFTypeRef)objc_msgSend(v8, "numberWithFloat:"), 1u);
        v9 = target;
        v10 = (const __CFString *)*MEMORY[0x1E0D05D68];
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*((id *)v5 + 12), "sceneMotionOffsetY");
        CMSetAttachment(v9, v10, (CFTypeRef)objc_msgSend(v11, "numberWithFloat:"), 1u);
      }
      if (v5[106])
        CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D58], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5[107]), 1u);
    }
    if (cf)
      CFRelease(cf);
    return (unsigned __int8 *)target;
  }
  return result;
}

- (void)node:(id)a3 didEmitCodesCount:(int64_t)a4 emittedIdentifiers:(id)a5 originalPTS:(id *)a6
{
  _BOOL8 isSmartCameraSceneConfident;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a6;
  -[BWMetadataDetectorGatingOutputController setLastDetectedCodesCount:originalPTS:](self, "setLastDetectedCodesCount:originalPTS:", a4, &v10);
  os_unfair_lock_lock(&self->_lock);
  isSmartCameraSceneConfident = self->_isSmartCameraSceneConfident;
  os_unfair_lock_unlock(&self->_lock);
  -[FigCaptureLogSmartCameraGating logSmartCamIsConfident:presentedIdentifiers:presentedCount:](self->_logger, "logSmartCamIsConfident:presentedIdentifiers:presentedCount:", isSmartCameraSceneConfident, a5, a4);
}

- (BWNodeOutput)nodeOutput
{
  return self->_nodeOutput;
}

- (BOOL)sceneMotionEstimatesSupported
{
  return self->_sceneMotionEstimatesSupported;
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (BOOL)synchronizeWithOtherControllers
{
  return self->_synchronizeWithOtherControllers;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionPTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setLastDetectionPTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastDetectionPTS.epoch = a3->var3;
  *(_OWORD *)&self->_lastDetectionPTS.value = v3;
}

- (BOOL)sceneLikelyToHaveCodes
{
  return self->_sceneLikelyToHaveCodes;
}

- (void)setLastDetectedCodesCount:(int64_t)a3
{
  self->_lastDetectedCodesCount = a3;
}

@end
