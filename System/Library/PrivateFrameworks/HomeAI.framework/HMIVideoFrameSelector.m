@implementation HMIVideoFrameSelector

- (HMIVideoFrameSelector)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  HMIVideoFrameSelector *v4;
  HMIVideoFrameSelector *v5;
  __int128 v6;
  CMTime v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMIVideoFrameSelector;
  v4 = -[HMIVideoAnalyzerProcessingNode initWithConfiguration:workQueue:](&v9, sel_initWithConfiguration_workQueue_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    CMTimeMake(&v8, 3, 10);
    v6 = *(_OWORD *)&v8.value;
    v5->_targetInterval.epoch = v8.epoch;
    *(_OWORD *)&v5->_targetInterval.value = v6;
    v5->_enabled = 1;
    v5->_resetReferences = 0;
    v5->_references = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    -[HMIVideoFrameSelector setSampleRate:](v5, "setSampleRate:", 3.0);
  }
  return v5;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t maxReferences;
  void *v7;
  opaqueCMSampleBuffer *ValueAtIndex;
  CFTypeRef v9;
  uint64_t v10;
  CMTimeEpoch v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  __int128 v15;
  CMTime time2;
  CMTime v17;
  CMTime referenceInterval;
  CMTime v19;
  CMTimeRange lhs;
  CMTime v21;
  CMTime rhs;
  CMTimeRange v23;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_enabled)
  {
    if (self->_resetReferences)
    {
      self->_resetReferences = 0;
      CFArrayRemoveAllValues(self->_references);
    }
    referenceInterval = (CMTime)self->_referenceInterval;
    maxReferences = self->_maxReferences;
    os_unfair_lock_unlock(p_lock);
    memset(&v17, 0, sizeof(v17));
    CMSampleBufferGetPresentationTimeStamp(&v17, a3);
    -[HMIVideoFrameSelector delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (CFArrayGetCount(self->_references) < 1)
      goto LABEL_7;
    ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(self->_references, 0);
    memset(&v23, 0, 24);
    CMSampleBufferGetPresentationTimeStamp(&v23.start, ValueAtIndex);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v23.start.value;
    lhs.start.epoch = v23.start.epoch;
    rhs = (CMTime)self->_targetInterval;
    CMTimeAdd(&time2, &lhs.start, &rhs);
    lhs.start = v17;
    if (CMTimeCompare(&lhs.start, &time2) < 0)
    {
LABEL_7:
      v9 = 0;
    }
    else
    {
      v9 = CFRetain(ValueAtIndex);
      CFArrayRemoveValueAtIndex(self->_references, 0);
    }
    memset(&v23, 0, sizeof(v23));
    HMICMSampleBufferGetPresentationTimeRange(a3, &v23);
    memset(&rhs, 0, sizeof(rhs));
    lhs = v23;
    CMTimeRangeGetEnd(&v21, &lhs);
    lhs.start = referenceInterval;
    v10 = CMTimeDivide();
    lhs.start = rhs;
    v15 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)&v19.value = *MEMORY[0x24BDC0D88];
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v19.epoch = v11;
    v12 = v10 - (CMTimeCompare(&lhs.start, &v19) == 0);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v23.start.value;
    lhs.start.epoch = v23.start.epoch;
    v19 = referenceInterval;
    if (CMTimeDivide() < v12
      || (lhs.start = rhs, *(_OWORD *)&v19.value = v15, v19.epoch = v11, !CMTimeCompare(&lhs.start, &v19)))
    {
      v13 = (const void *)objc_msgSend(v7, "frameSelector:prepareFrame:", self, a3, v15);
      if (v13)
      {
        v14 = v13;
        CFArrayAppendValue(self->_references, v13);
        CFRelease(v14);
      }
    }
    while (CFArrayGetCount(self->_references) > maxReferences)
      CFArrayRemoveValueAtIndex(self->_references, 0);
    if (v9)
    {
      objc_msgSend(v7, "frameSelector:didSelectFrame:reference:", self, a3, v9);
      CFRelease(v9);
    }
    else
    {
      objc_msgSend(v7, "frameSelector:didSkipFrame:", self, a3);
    }

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)flush
{
  CFArrayRemoveAllValues(self->_references);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_references);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoFrameSelector;
  -[HMIVideoFrameSelector dealloc](&v3, sel_dealloc);
}

- (void)setSampleRate:(double)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_referenceInterval;
  unint64_t v6;
  CMTime v7;
  CMTime v8;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  CMTime v13;

  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&time1, 1.0 / a3, 1000000);
  CMTimeMake(&time2, 86400, 1);
  CMTimeMinimum(&v13, &time1, &time2);
  os_unfair_lock_lock_with_options();
  p_referenceInterval = &self->_referenceInterval;
  lhs = v13;
  rhs = (CMTime)self->_referenceInterval;
  self->_resetReferences = CMTimeCompare(&lhs, &rhs) > 0;
  self->_referenceInterval = ($95D729B680665BEAEFA1D6FCA8238556)v13;
  self->_enabled = a3 > 0.0;
  lhs = (CMTime)self->_targetInterval;
  rhs = (CMTime)self->_referenceInterval;
  CMTimeAdd(&v8, &lhs, &rhs);
  lhs = (CMTime)self->_referenceInterval;
  if (CMTimeDivide() <= 14)
  {
    lhs = (CMTime)self->_targetInterval;
    *(_OWORD *)&rhs.value = *(_OWORD *)&p_referenceInterval->value;
    rhs.epoch = self->_referenceInterval.epoch;
    CMTimeAdd(&v7, &lhs, &rhs);
    *(_OWORD *)&lhs.value = *(_OWORD *)&p_referenceInterval->value;
    lhs.epoch = self->_referenceInterval.epoch;
    v6 = CMTimeDivide() + 1;
  }
  else
  {
    v6 = 15;
  }
  self->_maxReferences = v6;
  os_unfair_lock_unlock(&self->_lock);
}

- (HMIVideoFrameSelectorDelegate)delegate
{
  return (HMIVideoFrameSelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_targetInterval, 24, 1, 0);
  return result;
}

- (__CFArray)references
{
  return self->_references;
}

- (unint64_t)maxReferences
{
  return self->_maxReferences;
}

- (void)setMaxReferences:(unint64_t)a3
{
  self->_maxReferences = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)resetReferences
{
  return self->_resetReferences;
}

- (void)setResetReferences:(BOOL)a3
{
  self->_resetReferences = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_referenceInterval, 24, 1, 0);
  return result;
}

- (void)setReferenceInterval:(id *)a3
{
  objc_copyStruct(&self->_referenceInterval, a3, 24, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
