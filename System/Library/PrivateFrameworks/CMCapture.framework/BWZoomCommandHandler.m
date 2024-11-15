@implementation BWZoomCommandHandler

- (void)setZoomCompletionDelegate:(id)a3
{
  self->_zoomCompletionDelegate = (BWZoomCompletionDelegate *)a3;
}

- (BWZoomCommandHandler)init
{
  BWZoomCommandHandler *result;
  __int128 *v3;
  __int128 v9;
  int64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWZoomCommandHandler;
  result = -[BWZoomCommandHandler init](&v11, sel_init);
  if (result)
  {
    v3 = (__int128 *)MEMORY[0x1E0CA2E18];
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&result->_appliedZoomFactor = _D0;
    v9 = *v3;
    *(_OWORD *)&result->_rampStartTime.value = *v3;
    v10 = *((_QWORD *)v3 + 2);
    result->_rampStartTime.epoch = v10;
    result->_rampTargetFactor = 1.0;
    *(_QWORD *)&result->_rampAcceleration = 0x3F80000041700000;
    *(_OWORD *)&result->_lastFramePTSes[0].value = v9;
    result->_lastFramePTSes[0].epoch = v10;
    *(_OWORD *)&result->_lastFramePTSes[1].value = v9;
    result->_lastFramePTSes[1].epoch = v10;
    result->_zoomLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&result->_earlySwitchOverScaleFactorForZoomIn = _D0;
    result->_lastFrameCaptureID = -1;
  }
  return result;
}

- (float)requestedZoomFactor
{
  os_unfair_lock_s *p_zoomLock;
  float v4;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  v4 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_lastRequestedZoomFactor);
  os_unfair_lock_unlock(p_zoomLock);
  return v4;
}

- (float)appliedZoomFactor
{
  os_unfair_lock_s *p_zoomLock;
  float v4;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  v4 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_appliedZoomFactor);
  os_unfair_lock_unlock(p_zoomLock);
  return v4;
}

- (float)_applyFudgeToZoomFactor:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  double v10;
  float v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(a1 + 208);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "lowerBound");
        if (v9 <= a2)
        {
          objc_msgSend(v8, "upperBound");
          if (*(float *)&v10 >= a2)
          {
            *(float *)&v10 = a2;
            objc_msgSend(v8, "applyFudgeToZoomFactor:", v10);
            return v11;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  return a2;
}

- (float)earlySwitchOverScaleFactorForZoomIn
{
  os_unfair_lock_s *p_zoomLock;
  float earlySwitchOverScaleFactorForZoomIn;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  earlySwitchOverScaleFactorForZoomIn = self->_earlySwitchOverScaleFactorForZoomIn;
  os_unfair_lock_unlock(p_zoomLock);
  return earlySwitchOverScaleFactorForZoomIn;
}

- (float)rampTargetZoomFactor
{
  os_unfair_lock_s *p_zoomLock;
  float v4;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (self->_rampCommandID)
    v4 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_rampTargetFactor);
  else
    v4 = 0.0;
  os_unfair_lock_unlock(p_zoomLock);
  return v4;
}

- (int)rampTuning
{
  BWZoomCommandHandler *v2;
  os_unfair_lock_s *p_zoomLock;

  v2 = self;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  LODWORD(v2) = v2->_rampTuning;
  os_unfair_lock_unlock(p_zoomLock);
  return (int)v2;
}

- (float)allowableMinimumDigitalZoomFactorDuringZoomOut
{
  os_unfair_lock_s *p_zoomLock;
  float allowableMinimumDigitalZoomFactorDuringZoomOut;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  allowableMinimumDigitalZoomFactorDuringZoomOut = self->_allowableMinimumDigitalZoomFactorDuringZoomOut;
  os_unfair_lock_unlock(p_zoomLock);
  return allowableMinimumDigitalZoomFactorDuringZoomOut;
}

- (float)applyFudgeToZoomFactor:(float)a3
{
  os_unfair_lock_s *p_zoomLock;
  float v6;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  v6 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_zoomLock);
  return v6;
}

- (void)setFudgedZoomRanges:(id)a3
{
  os_unfair_lock_s *p_zoomLock;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);

  self->_fudgedZoomRanges = (NSArray *)objc_msgSend(a3, "copy");
  os_unfair_lock_unlock(p_zoomLock);
}

- (float)appliedZoomFactorWithoutFudge
{
  os_unfair_lock_s *p_zoomLock;
  float appliedZoomFactor;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  appliedZoomFactor = self->_appliedZoomFactor;
  os_unfair_lock_unlock(p_zoomLock);
  return appliedZoomFactor;
}

- (float)rampZoomFactorOfInterest
{
  os_unfair_lock_s *p_zoomLock;
  float rampZoomFactorOfInterest;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  rampZoomFactorOfInterest = self->_rampZoomFactorOfInterest;
  os_unfair_lock_unlock(p_zoomLock);
  return rampZoomFactorOfInterest;
}

- (float)predictRampZoomFactorAfterNumberOfFrames:(int)a3 settingZoomFactorOfInterest:(float)a4
{
  os_unfair_lock_s *p_zoomLock;
  _BOOL4 v8;
  unsigned int v9;
  float v10;
  float v11;
  float rampStartFactor;
  float rampTargetFactor;
  float v14;
  $95D729B680665BEAEFA1D6FCA8238556 v16;
  CMTime lhs;
  CMTime time;
  CMTime rhs;
  CMTime v20;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  v8 = self->_rampTargetVelocity != 0.0 || self->_rampCurrentVelocity != 0.0 || self->_rampCommandID != 0;
  if ((self->_lastFramePTSes[0].flags & 1) != 0)
    v9 = self->_lastFramePTSes[1].flags & 1;
  else
    v9 = 0;
  if ((v9 & v8) == 0)
  {
    v11 = 0.0;
    goto LABEL_18;
  }
  memset(&v20, 0, sizeof(v20));
  lhs = (CMTime)self->_lastFramePTSes[0];
  v16 = self->_lastFramePTSes[1];
  CMTimeSubtract(&time, &lhs, (CMTime *)&v16);
  CMTimeMultiply(&rhs, &time, a3);
  lhs = (CMTime)self->_lastFramePTSes[0];
  CMTimeAdd(&v20, &lhs, &rhs);
  lhs = v20;
  v10 = -[BWZoomCommandHandler _zoomFactorForRampAtPTS:updateCurrentZoomRampState:]((uint64_t)self, (uint64_t)&lhs, 0);
  v11 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, v10);
  if (a4 != 0.0 && self->_rampZoomFactorOfInterest == 0.0)
  {
    rampStartFactor = self->_rampStartFactor;
    rampTargetFactor = self->_rampTargetFactor;
    v14 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:]((uint64_t)self, self->_lastRequestedZoomFactor);
    if (rampStartFactor < rampTargetFactor)
    {
      if (v14 >= a4 || v11 < a4)
        goto LABEL_18;
LABEL_17:
      self->_rampZoomFactorOfInterest = a4;
      goto LABEL_18;
    }
    if (v14 > a4 && v11 <= a4)
      goto LABEL_17;
  }
LABEL_18:
  os_unfair_lock_unlock(p_zoomLock);
  return v11;
}

- (void)updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:(float)a3
{
  os_unfair_lock_s *p_zoomLock;
  unint64_t v6;
  unint64_t v7;
  BWZoomCompletionDelegate *zoomCompletionDelegate;
  BWZoomCompletionDelegate *zoomCompletionDelegateForStereoAudio;
  BOOL v10;

  v10 = 0;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  -[BWZoomCommandHandler _updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:zoomFactorChangedOut:]((uint64_t)self, &v10, a3);
  v7 = v6;
  os_unfair_lock_unlock(p_zoomLock);
  if (v10)
  {
    zoomCompletionDelegate = self->_zoomCompletionDelegate;
    -[BWZoomCommandHandler appliedZoomFactor](self, "appliedZoomFactor");
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegate, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v7) & 1, v7);
    zoomCompletionDelegateForStereoAudio = self->_zoomCompletionDelegateForStereoAudio;
    -[BWZoomCommandHandler appliedZoomFactor](self, "appliedZoomFactor");
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegateForStereoAudio, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v7) & 1, v7);
  }
}

- (float)updateZoomModelForNextFrameWithPTS:(id *)a3 captureID:(int)a4
{
  os_unfair_lock_s *p_zoomLock;
  int lastFrameCaptureID;
  BOOL v9;
  int v10;
  float v11;
  __int128 v13;
  int64_t var3;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (!self
    || a4 == -1
    || (lastFrameCaptureID = self->_lastFrameCaptureID,
        v9 = __OFSUB__(lastFrameCaptureID, a4),
        v10 = lastFrameCaptureID - a4,
        (v10 < 0) ^ v9)
    || (v11 = 0.0, v10 >= 1000))
  {
    v13 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v11 = -[BWZoomCommandHandler _updateZoomModelForNextFrameWithPTS:]((uint64_t)self, &v13);
    self->_lastFrameCaptureID = a4;
  }
  os_unfair_lock_unlock(p_zoomLock);
  return v11;
}

- (float)updateZoomModelAndAppliedZoomFactorForNextFrameWithPTS:(id *)a3 captureID:(int)a4 delayedISPAppliedZoomFactor:(float)a5
{
  os_unfair_lock_s *p_zoomLock;
  int lastFrameCaptureID;
  BOOL v11;
  int v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  BWZoomCompletionDelegate *zoomCompletionDelegate;
  BWZoomCompletionDelegate *zoomCompletionDelegateForStereoAudio;
  __int128 v19;
  int64_t var3;
  BOOL v21;

  v21 = 0;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (!self
    || a4 == -1
    || (lastFrameCaptureID = self->_lastFrameCaptureID,
        v11 = __OFSUB__(lastFrameCaptureID, a4),
        v12 = lastFrameCaptureID - a4,
        (v12 < 0) ^ v11)
    || v12 >= 1000)
  {
    v19 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v14 = -[BWZoomCommandHandler _updateZoomModelForNextFrameWithPTS:]((uint64_t)self, &v19);
    -[BWZoomCommandHandler _updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:zoomFactorChangedOut:]((uint64_t)self, &v21, a5);
    v13 = v15;
    self->_lastFrameCaptureID = a4;
  }
  else
  {
    v13 = 0;
    v14 = 0.0;
  }
  os_unfair_lock_unlock(p_zoomLock);
  if (v21)
  {
    zoomCompletionDelegate = self->_zoomCompletionDelegate;
    -[BWZoomCommandHandler appliedZoomFactor](self, "appliedZoomFactor");
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegate, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v13) & 1, v13);
    zoomCompletionDelegateForStereoAudio = self->_zoomCompletionDelegateForStereoAudio;
    -[BWZoomCommandHandler appliedZoomFactor](self, "appliedZoomFactor");
    -[BWZoomCompletionDelegate zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:](zoomCompletionDelegateForStereoAudio, "zoomCommandHandler:didApplyZoomFactor:zoomFactorWithoutFudge:targetZoomFactor:rampComplete:rampCommandID:", self, HIDWORD(v13) & 1, v13);
  }
  return v14;
}

- (float)_updateZoomModelForNextFrameWithPTS:(uint64_t)a1
{
  uint64_t v3;
  float v4;
  uint64_t v5;
  unsigned int v11;
  uint64_t v12;
  float v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  if (!a1)
    return 0.0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 72);
  v3 = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 56) = *a2;
  *(_QWORD *)(a1 + 72) = v3;
  if (*(float *)(a1 + 160) == 0.0
    && *(float *)(a1 + 196) == 0.0
    && *(double *)(a1 + 184) == 0.0
    && !*(_DWORD *)(a1 + 164))
  {
    v5 = 0;
  }
  else
  {
    v16 = *a2;
    v17 = *((_QWORD *)a2 + 2);
    v4 = -[BWZoomCommandHandler _zoomFactorForRampAtPTS:updateCurrentZoomRampState:](a1, (uint64_t)&v16, 1);
    if (v4 >= 1.0 && v4 != *(float *)(a1 + 16))
    {
      *(float *)(a1 + 16) = v4;
      *(_BYTE *)(a1 + 20) = 0;
      *(_QWORD *)(a1 + 112) = FigGetUpTimeNanoseconds() / 0xF4240uLL;
    }
    v5 = *(unsigned int *)(a1 + 164);
    if (v4 == *(float *)(a1 + 156) || *(float *)(a1 + 160) == 0.0 && *(float *)(a1 + 196) == 0.0)
    {
      v5 |= 0x100000000uLL;
      *(_QWORD *)(a1 + 160) = 0;
      *(_DWORD *)(a1 + 196) = 0;
      *(_QWORD *)(a1 + 184) = 0;
      *(_DWORD *)(a1 + 176) = 0;
      __asm { FMOV            V0.2S, #1.0 }
      *(_QWORD *)(a1 + 240) = _D0;
      *(_DWORD *)(a1 + 248) = 0;
    }
    else if (!*(_BYTE *)(a1 + 168))
    {
      if (*(_BYTE *)(a1 + 32))
      {
        v15 = *(_QWORD *)(a1 + 24);
        if (v15)
          *(_DWORD *)(v15 + 32) = 1;
      }
      *(_BYTE *)(a1 + 168) = 1;
    }
  }
  v11 = *(_DWORD *)(a1 + 16);
  v12 = *(unsigned int *)(a1 + 156);
  v13 = 0.0;
  if (!*(_BYTE *)(a1 + 20))
  {
    v13 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, *(float *)(a1 + 16));
    *(_BYTE *)(a1 + 20) = 1;
  }
  -[BWZoomDelayBuffer addZoomRequest:](*(_QWORD *)(a1 + 24), v11 | (unint64_t)(v12 << 32), v5);
  return v13;
}

- (uint64_t)_updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:(float)a3 zoomFactorChangedOut:
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  float v7;

  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 24);
    result = -[BWZoomDelayBuffer zoomRequestForISPAppliedZoomFactor:earlySwitchOverScaleFactorForZoomIn:](v5, a3, *(float *)(result + 240));
    v7 = *(float *)(v4 + 12);
    if (v7 != *(float *)&result)
      *(_DWORD *)(v4 + 12) = result;
    if (!v6 && *(float *)(v4 + 196) == 0.0 && *(float *)(v4 + 160) == 0.0 && *(_BYTE *)(v4 + 168))
    {
      if (v5 && *(_BYTE *)(v4 + 32))
        *(_DWORD *)(v5 + 32) = 0;
      *(_BYTE *)(v4 + 168) = 0;
    }
    if (a2)
      *a2 = v7 != *(float *)&result;
  }
  return result;
}

- (void)reset
{
  os_unfair_lock_s *p_zoomLock;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);

  self->_zoomDelayBuffer = (BWZoomDelayBuffer *)-[BWZoomDelayBuffer initWithMaxZoomDelay:currentZoomDelay:]([BWZoomDelayBuffer alloc], 0, 0);
  self->_lastFrameCaptureID = -1;
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)setRequestedZoomFactor:(float)a3
{
  float v4;
  os_unfair_lock_s *p_zoomLock;

  if (a3 >= 1.0)
    v4 = a3;
  else
    v4 = 1.0;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  if (v4 != self->_lastRequestedZoomFactor)
  {
    self->_lastRequestedZoomFactor = v4;
    self->_zoomFactorServiced = 0;
    self->_timeForLastRequestedZoomFactor = FigGetUpTimeNanoseconds() / 0xF4240uLL;
  }
  if (self->_rampTargetVelocity != 0.0 || self->_rampCurrentVelocity != 0.0)
  {
    *(_QWORD *)&self->_rampTargetVelocity = 0;
    self->_rampCurrentVelocity = 0.0;
    self->_rampZoomFactorOfInterest = 0.0;
  }
  os_unfair_lock_unlock(p_zoomLock);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWZoomCommandHandler;
  -[BWZoomCommandHandler dealloc](&v3, sel_dealloc);
}

- (float)requestedZoomFactorWithoutFudge
{
  os_unfair_lock_s *p_zoomLock;
  float lastRequestedZoomFactor;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  lastRequestedZoomFactor = self->_lastRequestedZoomFactor;
  os_unfair_lock_unlock(p_zoomLock);
  return lastRequestedZoomFactor;
}

- (float)removeFudgeFromZoomFactor:(float)a3
{
  os_unfair_lock_s *p_zoomLock;
  float v6;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  v6 = -[BWZoomCommandHandler _removeFudgeFromZoomFactor:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_zoomLock);
  return v6;
}

- (float)_removeFudgeFromZoomFactor:(uint64_t)a1
{
  float v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  float v10;
  double v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = 0.0;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(void **)(a1 + 208);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "fudgedLowerBound");
          if (v10 <= a2)
          {
            objc_msgSend(v9, "fudgedUpperBound");
            if (*(float *)&v11 >= a2)
            {
              *(float *)&v11 = a2;
              objc_msgSend(v9, "removeFudgeFromZoomFactor:", v11);
              return v12;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  return v2;
}

- (void)rampToVideoZoomFactor:(float)a3 withRampType:(int)a4 rate:(float)a5 duration:(double)a6 snapToTargetZoomFactorWithinRampFraction:(float)a7 rampTuning:(int)a8 earlySwitchOverScaleFactorForZoomIn:(float)a9 allowableMinimumDigitalZoomFactorDuringZoomOut:(float)a10 commandID:(int)a11
{
  os_unfair_lock_s *p_zoomLock;
  float lastRequestedZoomFactor;
  float rampCurrentVelocity;
  float v24;
  float v25;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_rampStartTime = self->_lastFramePTSes[0];
  lastRequestedZoomFactor = self->_lastRequestedZoomFactor;
  rampCurrentVelocity = self->_rampCurrentVelocity;
  self->_rampStartFactor = lastRequestedZoomFactor;
  self->_rampStartVelocity = rampCurrentVelocity;
  self->_rampTargetFactor = a3;
  self->_rampCommandID = a11;
  self->_rampZoomFactorOfInterest = 0.0;
  self->_rampType = a4;
  self->_rampTuning = a8;
  self->_earlySwitchOverScaleFactorForZoomIn = a9;
  self->_allowableMinimumDigitalZoomFactorDuringZoomOut = a10;
  switch(a4)
  {
    case 3:
      self->_rampTargetVelocity = 0.0;
      self->_rampDuration = a6;
      self->_rampSnapFraction = a7;
      *(int8x8_t *)&self->_springRampTension = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(lastRequestedZoomFactor < a3), 0x1FuLL)), (int8x8_t)0x41A8000042B80000, (int8x8_t)0x41B8000043070000);
      self->_springRampStartFrameDelayAt30fps = 1;
      break;
    case 2:
      self->_rampTargetVelocity = 0.0;
      self->_rampDuration = a6;
      self->_rampSnapFraction = a7;
      break;
    case 1:
      v24 = fabsf(a5);
      if (lastRequestedZoomFactor >= a3)
        v25 = -v24;
      else
        v25 = v24;
      self->_rampTargetVelocity = v25;
      self->_rampDuration = 0.0;
      self->_rampSnapFraction = 0.0;
      break;
  }
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)rampToVideoZoomFactor:(float)a3 usingSpringWithTension:(float)a4 friction:(float)a5 snapFraction:(float)a6 rampTuning:(int)a7 earlySwitchOverScaleFactorForZoomIn:(float)a8 allowableMinimumDigitalZoomFactorDuringZoomOut:(float)a9 rampStartFrameDelayAt30fps:(int)a10 commandID:(int)a11
{
  os_unfair_lock_s *p_zoomLock;
  float rampCurrentVelocity;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_rampStartTime = self->_lastFramePTSes[0];
  rampCurrentVelocity = self->_rampCurrentVelocity;
  self->_rampStartFactor = self->_lastRequestedZoomFactor;
  self->_rampStartVelocity = rampCurrentVelocity;
  self->_rampTargetFactor = a3;
  self->_rampZoomFactorOfInterest = 0.0;
  self->_rampType = 3;
  self->_rampTuning = a7;
  self->_rampTargetVelocity = 0.0;
  self->_rampCommandID = a11;
  self->_rampSnapFraction = a6;
  self->_springRampTension = a4;
  self->_springRampFriction = a5;
  self->_earlySwitchOverScaleFactorForZoomIn = a8;
  self->_allowableMinimumDigitalZoomFactorDuringZoomOut = a9;
  self->_springRampStartFrameDelayAt30fps = a10;
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)setTypicalISPZoomDelay:(unsigned int)a3 maxISPZoomDelay:(unsigned int)a4 clientCanCompensateForDelay:(BOOL)a5
{
  _BOOL4 v5;
  os_unfair_lock_s *p_zoomLock;
  BOOL v10;
  BWZoomDelayBuffer *v11;
  int rampActive;

  v5 = a5;
  self->_clientCanCompensateForDelay = a5;
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  v10 = self->_rampTargetVelocity != 0.0 || self->_rampCurrentVelocity != 0.0;
  self->_rampActive = v10;

  v11 = (BWZoomDelayBuffer *)-[BWZoomDelayBuffer initWithMaxZoomDelay:currentZoomDelay:]([BWZoomDelayBuffer alloc], a4, a3);
  self->_zoomDelayBuffer = v11;
  if (v5)
  {
    if (v11)
    {
      rampActive = self->_rampActive;
LABEL_9:
      v11->_operatingMode = rampActive;
    }
  }
  else if (v11)
  {
    rampActive = 2 * (a3 != 0);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(p_zoomLock);
}

- (void)updateISPZoomDelay:(unsigned int)a3
{
  os_unfair_lock_s *p_zoomLock;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  -[BWZoomDelayBuffer updateZoomDelay:]((uint64_t)self->_zoomDelayBuffer, a3);
  os_unfair_lock_unlock(p_zoomLock);
}

- (float)_zoomFactorForRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  float v3;
  int v7;
  CMTime v10;
  CMTime time1;

  v3 = 0.0;
  if (a1)
  {
    if ((*(_BYTE *)(a2 + 12) & 1) != 0)
    {
      time1 = *(CMTime *)a2;
      v10 = *(CMTime *)(a1 + 120);
      if (CMTimeCompare(&time1, &v10) >= 1)
      {
        v7 = *(_DWORD *)(a1 + 172);
        switch(v7)
        {
          case 1:
            time1 = *(CMTime *)a2;
            return -[BWZoomCommandHandler _zoomFactorForRateBasedRampAtPTS:updateCurrentZoomRampState:](a1, &time1, a3);
          case 3:
            time1 = *(CMTime *)a2;
            return -[BWZoomCommandHandler _zoomFactorForSpringBasedRampAtPTS:updateCurrentZoomRampState:](a1, &time1, a3);
          case 2:
            time1 = *(CMTime *)a2;
            return -[BWZoomCommandHandler _zoomFactorForDurationBasedRampAtPTS:updateCurrentZoomRampState:](a1, &time1, a3);
        }
      }
    }
  }
  return v3;
}

- (void)resetZoomFactorOfInterest
{
  os_unfair_lock_s *p_zoomLock;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_rampZoomFactorOfInterest = 0.0;
  os_unfair_lock_unlock(p_zoomLock);
}

- (int64_t)timeForLastRequestedZoomFactor
{
  os_unfair_lock_s *p_zoomLock;
  int64_t timeForLastRequestedZoomFactor;

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  timeForLastRequestedZoomFactor = self->_timeForLastRequestedZoomFactor;
  os_unfair_lock_unlock(p_zoomLock);
  return timeForLastRequestedZoomFactor;
}

- (float)_zoomFactorForDurationBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  float Seconds;
  float v6;
  float v7;
  float v8;
  int v9;
  float v10;
  float v12;
  float v13;
  BOOL v14;
  CMTime v16;
  CMTime lhs;
  CMTime time;

  if (!a1)
    return 0.0;
  lhs = *a2;
  v16 = *(CMTime *)(a1 + 120);
  CMTimeSubtract(&time, &lhs, &v16);
  Seconds = CMTimeGetSeconds(&time);
  v6 = 1.0 - pow(0.00499999523, Seconds / *(double *)(a1 + 184));
  v7 = *(float *)(a1 + 148);
  v8 = *(float *)(a1 + 156);
  if (v7 < v8)
    v9 = -1;
  else
    v9 = v7 > v8;
  if ((float)(1.0 - *(float *)(a1 + 192)) <= v6)
    v10 = *(float *)(a1 + 156);
  else
    v10 = v7 + (float)(v6 * (float)(v8 - v7));
  if (Seconds != 0.0 && a3 != 0)
  {
    v12 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, v10);
    v13 = *(float *)(a1 + 200);
    if (v13 != 0.0)
    {
      v14 = v7 < v8;
      if (v12 >= v13)
        v14 = v9 == v12 > v13;
      if (!v14)
        *(_DWORD *)(a1 + 200) = 0;
    }
    *(float *)(a1 + 196) = log2f(vabds_f32(*(float *)(a1 + 148), v10) / Seconds) * (float)-v9;
  }
  return v10;
}

- (float)_zoomFactorForRateBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  float Seconds;
  float v6;
  float v7;
  float v8;
  float v9;
  _BOOL4 v10;
  int v11;
  float v12;
  float v13;
  _BOOL4 v14;
  int v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  _BOOL4 v21;
  float v22;
  float v23;
  float v24;
  BOOL v25;
  CMTime v27;
  CMTime lhs;
  CMTime time;

  if (!a1)
    return 0.0;
  lhs = *a2;
  v27 = *(CMTime *)(a1 + 120);
  CMTimeSubtract(&time, &lhs, &v27);
  Seconds = CMTimeGetSeconds(&time);
  v7 = *(float *)(a1 + 156);
  v6 = *(float *)(a1 + 160);
  v9 = *(float *)(a1 + 148);
  v8 = *(float *)(a1 + 152);
  v10 = v8 < v6;
  v11 = v8 > v6;
  if (v8 < v6)
    v11 = -1;
  v12 = *(float *)(a1 + 144);
  if (v11 >= 1)
    v12 = -v12;
  v13 = v8 + (float)(v12 * Seconds);
  v14 = v11 == v13 > v6;
  if (v13 >= v6)
    v10 = v14;
  if (v9 < v7)
    v15 = -1;
  else
    v15 = v9 > v7;
  v16 = (float)(v6 * (float)(1.0 - (float)((float)((float)(v6 - v8) / v12) / Seconds)))
      + (float)((float)((float)(v8 + v6) * 0.5) * (float)((float)((float)(v6 - v8) / v12) / Seconds));
  v17 = (float)(v8 + v13) * 0.5;
  if (v10)
  {
    v18 = v13;
  }
  else
  {
    v17 = v16;
    v18 = *(float *)(a1 + 160);
  }
  v19 = v17 * 0.693147181 * Seconds;
  v20 = v9 * expf(v19);
  if (v20 < 1.0)
    v20 = 1.0;
  v21 = v15 == v20 > v7;
  if (v20 < v7)
    v21 = v9 < v7;
  if (v21)
    v22 = v20;
  else
    v22 = v7;
  if (a3)
  {
    v23 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, v22);
    v24 = *(float *)(a1 + 200);
    if (v24 != 0.0)
    {
      v25 = v9 < v7;
      if (v23 >= v24)
        v25 = v15 == v23 > v24;
      if (!v25)
        *(_DWORD *)(a1 + 200) = 0;
    }
    *(float *)(a1 + 196) = v18;
  }
  return v22;
}

- (float)_zoomFactorForSpringBasedRampAtPTS:(int)a3 updateCurrentZoomRampState:
{
  float Seconds;
  float v6;
  float v7;
  int v8;
  double v9;
  BWSpringSimulation *v10;
  int v11;
  int v12;
  int v13;
  double v14;
  float v15;
  double v16;
  float v17;
  float v18;
  BOOL v19;
  double v20;
  CMTime v22;
  CMTime lhs;
  CMTime time;

  if (!a1)
    return 0.0;
  lhs = *a2;
  v22 = *(CMTime *)(a1 + 120);
  CMTimeSubtract(&time, &lhs, &v22);
  Seconds = CMTimeGetSeconds(&time);
  v6 = *(float *)(a1 + 156);
  v7 = *(float *)(a1 + 148);
  if (v7 < v6)
    v8 = -1;
  else
    v8 = v7 > v6;
  v9 = (float)(*(float *)(a1 + 152) * (float)-v8);
  v10 = objc_alloc_init(BWSpringSimulation);
  -[BWSpringSimulation setTension:](v10, "setTension:", *(float *)(a1 + 232));
  -[BWSpringSimulation setFriction:](v10, "setFriction:", *(float *)(a1 + 236));
  -[BWSpringSimulation resetWithInput:initialOutput:initialVelocity:convergedSpeed:](v10, "resetWithInput:initialOutput:initialVelocity:convergedSpeed:", 1.0, 0.0, v9, 0.001);
  v11 = FigCaptureRoundFloatToMultipleOf(1, Seconds * 60.0);
  v12 = *(_DWORD *)(a1 + 248);
  if (((2 * v12) | 1) <= v11)
  {
    v13 = v11 - 2 * v12;
    while (1)
    {
      -[BWSpringSimulation update](v10, "update");
      if (*(float *)(a1 + 192) > 0.0)
      {
        -[BWSpringSimulation output](v10, "output");
        if (v14 >= 1.0 - *(float *)(a1 + 192))
          break;
      }
      if (!--v13)
        goto LABEL_10;
    }
LABEL_11:
    v15 = *(float *)(a1 + 156);
    if (!a3)
      goto LABEL_22;
LABEL_14:
    if (Seconds != 0.0)
    {
      v17 = -[BWZoomCommandHandler _applyFudgeToZoomFactor:](a1, v15);
      v18 = *(float *)(a1 + 200);
      if (v18 != 0.0)
      {
        if (v17 >= v18)
          v19 = v8 == v17 > v18;
        else
          v19 = v7 < v6;
        if (!v19)
          *(_DWORD *)(a1 + 200) = 0;
      }
      -[BWSpringSimulation velocity](v10, "velocity");
      *(float *)&v20 = v20 * (double)-v8;
      *(_DWORD *)(a1 + 196) = LODWORD(v20);
    }
    goto LABEL_22;
  }
LABEL_10:
  if (-[BWSpringSimulation isCompleted](v10, "isCompleted"))
    goto LABEL_11;
  -[BWSpringSimulation output](v10, "output");
  *(float *)&v16 = v16;
  v15 = *(float *)(a1 + 148) + (float)(*(float *)&v16 * (float)(*(float *)(a1 + 156) - *(float *)(a1 + 148)));
  if (a3)
    goto LABEL_14;
LABEL_22:

  return v15;
}

- (BWZoomCompletionDelegate)zoomCompletionDelegate
{
  return self->_zoomCompletionDelegate;
}

- (BWZoomCompletionDelegate)zoomCompletionDelegateForStereoAudio
{
  return self->_zoomCompletionDelegateForStereoAudio;
}

- (void)setZoomCompletionDelegateForStereoAudio:(id)a3
{
  self->_zoomCompletionDelegateForStereoAudio = (BWZoomCompletionDelegate *)a3;
}

@end
