@implementation HMIVideoFrameIntervalSampler

- (HMIVideoFrameIntervalSampler)initWithFrameRate:(float)a3
{
  CMTime v5;

  CMTimeMakeWithSeconds(&v5, (float)(1.0 / a3), 1000);
  return -[HMIVideoFrameIntervalSampler initWithInterval:](self, "initWithInterval:", &v5);
}

- (HMIVideoFrameIntervalSampler)initWithInterval:(id *)a3
{
  HMIVideoFrameIntervalSampler *result;
  int64_t var3;
  _OWORD *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMIVideoFrameIntervalSampler;
  result = -[HMIVideoFrameIntervalSampler init](&v7, sel_init);
  if (result)
  {
    var3 = a3->var3;
    *(_OWORD *)&result->_interval.value = *(_OWORD *)&a3->var0;
    result->_interval.epoch = var3;
    v6 = (_OWORD *)MEMORY[0x24BDC0D40];
    result->_firstPTS.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    *(_OWORD *)&result->_firstPTS.value = *v6;
    result->_lastIndex = -1;
  }
  return result;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_firstPTS;
  int64_t v6;
  int64_t lastIndex;
  void *v8;
  void *v9;
  id v10;
  CMTime v11;
  CMTime lhs;
  CMTime v13;
  CMTime v14;

  memset(&v14, 0, sizeof(v14));
  CMSampleBufferGetPresentationTimeStamp(&v14, a3);
  if ((v14.flags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Sample buffer has an invalid PTS."), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  p_firstPTS = &self->_firstPTS;
  if ((self->_firstPTS.flags & 1) == 0)
  {
    *(_OWORD *)&p_firstPTS->value = *(_OWORD *)&v14.value;
    self->_firstPTS.epoch = v14.epoch;
  }
  lhs = v14;
  *(_OWORD *)&v11.value = *(_OWORD *)&p_firstPTS->value;
  v11.epoch = self->_firstPTS.epoch;
  CMTimeSubtract(&v13, &lhs, &v11);
  lhs = (CMTime)self->_interval;
  v6 = CMTimeDivide();
  lastIndex = self->_lastIndex;
  -[HMIVideoFrameSampler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 <= lastIndex)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "frameSampler:didDropFrame:", self, a3);

  }
  else
  {
    objc_msgSend(v8, "frameSampler:didSampleFrame:", self, a3);

    self->_lastIndex = v6;
  }
}

@end
