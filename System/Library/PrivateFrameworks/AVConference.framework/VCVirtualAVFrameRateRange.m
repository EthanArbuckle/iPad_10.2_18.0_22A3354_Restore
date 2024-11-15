@implementation VCVirtualAVFrameRateRange

- (VCVirtualAVFrameRateRange)initWithMinFrameRate:(double)a3 maxFrameRate:(double)a4
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_virtualMinFrameDuration;
  $95D729B680665BEAEFA1D6FCA8238556 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_virtualMinFrameRate = a3;
  self->_virtualMaxFrameRate = a4;
  p_virtualMinFrameDuration = &self->_virtualMinFrameDuration;
  CMTimeMake((CMTime *)&v7, 1, (int)a4);
  *p_virtualMinFrameDuration = v7;
  CMTimeMake((CMTime *)&v7, 1, (int)self->_virtualMinFrameRate);
  self->_virtualMaxFrameDuration = v7;
  return self;
}

- (double)minFrameRate
{
  return self->_virtualMinFrameRate;
}

- (void)setMinFrameRate:(double)a3
{
  self->_virtualMinFrameRate = a3;
}

- (double)maxFrameRate
{
  return self->_virtualMaxFrameRate;
}

- (void)setMaxFrameRate:(double)a3
{
  self->_virtualMaxFrameRate = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_virtualMaxFrameDuration, 24, 1, 0);
  return result;
}

- (void)setMaxFrameDuration:(id *)a3
{
  objc_copyStruct(&self->_virtualMaxFrameDuration, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_virtualMinFrameDuration, 24, 1, 0);
  return result;
}

- (void)setMinFrameDuration:(id *)a3
{
  objc_copyStruct(&self->_virtualMinFrameDuration, a3, 24, 1, 0);
}

@end
