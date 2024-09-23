@implementation AVCaptureAudioChannel

- (void)invalidate
{
  self->_internal->connection = 0;
}

- (AVCaptureAudioChannel)initWithConnection:(id)a3
{
  AVCaptureAudioChannel *v4;
  AVCaptureAudioChannelInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCaptureAudioChannel;
  v4 = -[AVCaptureAudioChannel init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptureAudioChannelInternal);
    v4->_internal = v5;
    if (v5)
    {
      v5->connection = (AVCaptureConnection *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureAudioChannel;
  -[AVCaptureAudioChannel dealloc](&v3, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_class();
}

- (float)averagePowerLevel
{
  float result;

  -[AVCaptureConnection getAvgAudioLevelForChannel:](self->_internal->connection, "getAvgAudioLevelForChannel:", self);
  return result;
}

- (float)peakHoldLevel
{
  float result;

  -[AVCaptureConnection getPeakAudioLevelForChannel:](self->_internal->connection, "getPeakAudioLevelForChannel:", self);
  return result;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)volume
{
  self->_volume = volume;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

@end
