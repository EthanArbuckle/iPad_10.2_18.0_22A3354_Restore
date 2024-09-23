@implementation AVMIDINoteEvent

- (AVMIDINoteEvent)initWithChannel:(UInt32)channel key:(UInt32)keyNum velocity:(UInt32)velocity duration:(AVMusicTimeStamp)duration
{
  UInt8 v7;
  UInt8 v8;
  UInt8 v9;
  AVMIDINoteEvent *result;
  Float32 v11;
  objc_super v12;

  v7 = velocity;
  v8 = keyNum;
  v9 = channel;
  v12.receiver = self;
  v12.super_class = (Class)AVMIDINoteEvent;
  result = -[AVMIDINoteEvent init](&v12, sel_init);
  if (result)
  {
    result->_msg.channel = v9;
    result->_msg.note = v8;
    result->_msg.velocity = v7;
    result->_msg.releaseVelocity = 0;
    v11 = duration;
    result->_msg.duration = v11;
  }
  return result;
}

- (UInt32)channel
{
  return self->_msg.channel;
}

- (void)setChannel:(UInt32)channel
{
  self->_msg.channel = channel;
}

- (UInt32)key
{
  return self->_msg.note;
}

- (void)setKey:(UInt32)key
{
  self->_msg.note = key;
}

- (UInt32)velocity
{
  return self->_msg.velocity;
}

- (void)setVelocity:(UInt32)velocity
{
  self->_msg.velocity = velocity;
}

- (AVMusicTimeStamp)duration
{
  return self->_msg.duration;
}

- (void)setDuration:(AVMusicTimeStamp)duration
{
  Float32 v3;

  v3 = fmin(duration, 0.0);
  self->_msg.duration = v3;
}

- (AVMIDINoteEvent)initWithMessage:(MIDINoteMessage *)a3
{
  AVMIDINoteEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMIDINoteEvent;
  result = -[AVMIDINoteEvent init](&v5, sel_init);
  if (result)
    result->_msg = *a3;
  return result;
}

- (MIDINoteMessage)message
{
  return &self->_msg;
}

- (BOOL)isEqualTo:(id)a3
{
  return *(_QWORD *)&self->_msg == *(_QWORD *)objc_msgSend(a3, "message");
}

@end
