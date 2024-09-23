@implementation AXSDTimedAudioBuffer

- (AXSDTimedAudioBuffer)initWithBuffer:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  AXSDTimedAudioBuffer *v8;
  AXSDTimedAudioBuffer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXSDTimedAudioBuffer;
  v8 = -[AXSDTimedAudioBuffer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXSDTimedAudioBuffer setBuffer:](v8, "setBuffer:", v6);
    -[AXSDTimedAudioBuffer setTime:](v9, "setTime:", v7);
  }

  return v9;
}

- (AVAudioPCMBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (AVAudioTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
