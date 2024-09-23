@implementation VCIDRSchedulerStream

+ (id)schedulerStreamWithKeyFrameInterval:(unsigned int)a3 framerate:(unsigned int)a4 weightFactor:(unsigned int)a5
{
  return -[VCIDRSchedulerStream initWithKeyFrameInterval:framerate:weightFactor:]([VCIDRSchedulerStream alloc], "initWithKeyFrameInterval:framerate:weightFactor:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (VCIDRSchedulerStream)initWithKeyFrameInterval:(unsigned int)a3 framerate:(unsigned int)a4 weightFactor:(unsigned int)a5
{
  VCIDRSchedulerStream *result;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCIDRSchedulerStream;
  result = -[VCIDRSchedulerStream init](&v9, sel_init);
  if (result)
  {
    result->_keyFrameInterval = a3;
    result->_framerate = a4;
    result->_weightFactor = a5;
  }
  return result;
}

- (int64_t)compareWeightFactor:(id)a3
{
  unsigned int weightFactor;
  unsigned int v7;

  weightFactor = self->_weightFactor;
  if (weightFactor > objc_msgSend(a3, "weightFactor"))
    return -1;
  v7 = self->_weightFactor;
  return v7 != objc_msgSend(a3, "weightFactor");
}

- (id)description
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stream: KeyInterval=%d, framerate=%d, weightFactor:%d"), self->_keyFrameInterval, self->_framerate, self->_weightFactor);
  if (self->_framesPerIdrPeriod)
    return (id)objc_msgSend(result, "stringByAppendingFormat:", CFSTR(" => FramesPerPeriod:%d FramePosition:%d"), self->_framesPerIdrPeriod, self->_framePosition);
  return result;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (unsigned)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unsigned int)a3
{
  self->_framerate = a3;
}

- (unsigned)weightFactor
{
  return self->_weightFactor;
}

- (void)setWeightFactor:(unsigned int)a3
{
  self->_weightFactor = a3;
}

- (unsigned)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unsigned int)a3
{
  self->_framePosition = a3;
}

- (unsigned)framesPerIdrPeriod
{
  return self->_framesPerIdrPeriod;
}

- (void)setFramesPerIdrPeriod:(unsigned int)a3
{
  self->_framesPerIdrPeriod = a3;
}

@end
