@implementation AVSampleBufferRequest

+ (AVSampleBufferRequest)sampleBufferRequestWithStartCursor:(id)a3
{
  return (AVSampleBufferRequest *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartCursor:", a3);
}

- (AVSampleBufferRequest)initWithStartCursor:(AVSampleCursor *)startCursor
{
  AVSampleBufferRequest *v4;
  AVSampleBufferRequestInternal *v5;
  AVSampleBufferRequestInternal *request;
  _OWORD *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVSampleBufferRequest;
  v4 = -[AVSampleBufferRequest init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVSampleBufferRequestInternal);
    v4->_request = v5;
    CFRetain(v5);
    if (startCursor && v4->_request)
    {
      v4->_request->startCursor = startCursor;
      request = v4->_request;
      v7 = (_OWORD *)MEMORY[0x1E0CA2E18];
      request->overrideTime.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      *(_OWORD *)&request->overrideTime.value = *v7;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVSampleBufferRequest)init
{
  return -[AVSampleBufferRequest initWithStartCursor:](self, "initWithStartCursor:", 0);
}

- (void)dealloc
{
  AVSampleBufferRequestInternal *request;
  objc_super v4;

  request = self->_request;
  if (request)
  {

    CFRelease(self->_request);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferRequest;
  -[AVSampleBufferRequest dealloc](&v4, sel_dealloc);
}

- (AVSampleCursor)startCursor
{
  return self->_request->startCursor;
}

- (AVSampleBufferRequestDirection)direction
{
  return self->_request->direction;
}

- (void)setDirection:(AVSampleBufferRequestDirection)direction
{
  self->_request->direction = direction;
}

- (AVSampleCursor)limitCursor
{
  return self->_request->limitCursor;
}

- (void)setLimitCursor:(AVSampleCursor *)limitCursor
{
  AVSampleCursor *v5;

  v5 = limitCursor;

  self->_request->limitCursor = limitCursor;
}

- (NSInteger)preferredMinSampleCount
{
  return self->_request->preferredMinSampleCount;
}

- (void)setPreferredMinSampleCount:(NSInteger)preferredMinSampleCount
{
  self->_request->preferredMinSampleCount = preferredMinSampleCount;
}

- (NSInteger)maxSampleCount
{
  return self->_request->maxSampleCount;
}

- (void)setMaxSampleCount:(NSInteger)maxSampleCount
{
  self->_request->maxSampleCount = maxSampleCount;
}

- (AVSampleBufferRequestMode)mode
{
  return self->_request->mode;
}

- (int)_figSampleGeneratorReadPolicy
{
  return 2 * (self->_request->mode != 1);
}

- (unsigned)_figSampleGeneratorReadFlags
{
  return self->_request->mode == 2;
}

- (void)setMode:(AVSampleBufferRequestMode)mode
{
  self->_request->mode = mode;
}

- (CMTime)overrideTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 56);
  return self;
}

- (void)setOverrideTime:(CMTime *)overrideTime
{
  AVSampleBufferRequestInternal *request;
  __int128 v4;

  request = self->_request;
  v4 = *(_OWORD *)&overrideTime->value;
  request->overrideTime.epoch = overrideTime->epoch;
  *(_OWORD *)&request->overrideTime.value = v4;
}

@end
