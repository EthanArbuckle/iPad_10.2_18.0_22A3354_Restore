@implementation AVCTestMonitorInjectAudioConfig

- (int)injectAudioConfigType
{
  return self->_injectAudioConfigType;
}

- (void)setInjectAudioConfigType:(int)a3
{
  self->_injectAudioConfigType = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (NSString)audioFileName
{
  return self->_audioFileName;
}

- (void)setAudioFileName:(id)a3
{
  self->_audioFileName = (NSString *)a3;
}

- (double)startHostTime
{
  return self->_startHostTime;
}

- (void)setStartHostTime:(double)a3
{
  self->_startHostTime = a3;
}

- (double)loopLength
{
  return self->_loopLength;
}

- (void)setLoopLength:(double)a3
{
  self->_loopLength = a3;
}

@end
