@implementation HMIVideoRetimer

- (HMIVideoRetimer)init
{
  HMIVideoRetimer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMIVideoRetimer;
  result = -[HMIVideoRetimer init](&v3, sel_init);
  if (result)
    result->_lastSample = 0;
  return result;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *lastSample;
  objc_super v4;

  lastSample = self->_lastSample;
  if (lastSample)
    CFRelease(lastSample);
  v4.receiver = self;
  v4.super_class = (Class)HMIVideoRetimer;
  -[HMIVideoRetimer dealloc](&v4, sel_dealloc);
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  HMIVideoRetimer *v6;
  SEL v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  CMTime v9;
  CMTime lhs;
  CMSampleTimingInfo v11;
  CMTime v12;
  CMTime v13;
  CMSampleBufferRef sampleBufferOut;

  if (HMICMSampleBufferGetMediaType(a3) == 1986618469)
  {
    sampleBufferOut = 0;
    if (self->_lastSample)
    {
      memset(&v13, 0, sizeof(v13));
      CMSampleBufferGetPresentationTimeStamp(&v13, a3);
      memset(&v12, 0, sizeof(v12));
      CMSampleBufferGetPresentationTimeStamp(&v12, self->_lastSample);
      memset(&v11, 0, 24);
      v11.decodeTimeStamp = v12;
      v11.presentationTimeStamp = v12;
      lhs = v13;
      v9 = v12;
      CMTimeSubtract(&v11.duration, &lhs, &v9);
      CMSampleBufferCreateCopyWithNewTiming(0, self->_lastSample, 1, &v11, &sampleBufferOut);
      -[HMIVideoRetimer delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "retimer:didRetimeSampleBuffer:", self, sampleBufferOut);

      CFRelease(sampleBufferOut);
      CFRelease(self->_lastSample);
    }
    self->_lastSample = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  else
  {
    v6 = (HMIVideoRetimer *)_HMFPreconditionFailure();
    -[HMIVideoRetimer flushWithNextSamplePTS:](v6, v7, v8);
  }
}

- (void)flushWithNextSamplePTS:(id *)a3
{
  opaqueCMSampleBuffer *lastSample;
  void *v6;
  HMIVideoRetimer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CMTime v11;
  CMSampleBufferRef sampleBufferOut;
  CMTime time2;
  CMTime v14;
  CMSampleTimingInfo time1;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  lastSample = self->_lastSample;
  if (lastSample)
  {
    memset(&v14, 0, sizeof(v14));
    CMSampleBufferGetPresentationTimeStamp(&v14, lastSample);
    time1.duration = v14;
    time2 = *(CMTime *)a3;
    if (CMTimeCompare(&time1.duration, &time2) <= 0)
    {
      *(_OWORD *)&time1.decodeTimeStamp.value = *(_OWORD *)&v14.value;
      *(_OWORD *)&time1.presentationTimeStamp.value = *(_OWORD *)&v14.value;
      *(_OWORD *)&time2.value = *(_OWORD *)&a3->var0;
      time1.decodeTimeStamp.epoch = v14.epoch;
      time1.presentationTimeStamp.epoch = v14.epoch;
      v11.epoch = v14.epoch;
      sampleBufferOut = 0;
      memset(&time1, 0, 24);
      time2.epoch = a3->var3;
      *(_OWORD *)&v11.value = *(_OWORD *)&v14.value;
      CMTimeSubtract(&time1.duration, &time2, &v11);
      CMSampleBufferCreateCopyWithNewTiming(0, self->_lastSample, 1, &time1, &sampleBufferOut);
      -[HMIVideoRetimer delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "retimer:didRetimeSampleBuffer:", self, sampleBufferOut);

      CFRelease(sampleBufferOut);
    }
    else
    {
      v6 = (void *)MEMORY[0x220735570]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time1.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&time1.duration.value + 4) = (CMTimeValue)v9;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Dropping frame, lastSamplePTS > nextSamplePTS.", (uint8_t *)&time1, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
    CFRelease(self->_lastSample);
    self->_lastSample = 0;
  }
}

- (HMIVideoRetimerDelegate)delegate
{
  return (HMIVideoRetimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
