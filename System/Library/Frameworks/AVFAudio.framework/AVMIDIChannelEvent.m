@implementation AVMIDIChannelEvent

- (UInt32)channel
{
  return self->_msg.status & 0xF;
}

- (void)setChannel:(UInt32)channel
{
  self->_msg.status = self->_msg.status & 0x80 | channel;
}

- (AVMIDIChannelEvent)initWithChannel:(unsigned __int8)a3 status:(unsigned __int8)a4 data1:(unsigned __int8)a5 data2:(unsigned __int8)a6
{
  AVMIDIChannelEvent *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMIDIChannelEvent;
  result = -[AVMIDIChannelEvent init](&v11, sel_init);
  if (result)
  {
    result->_msg.status = a3 & 0xF | a4;
    result->_msg.data1 = a5;
    result->_msg.data2 = a6;
    result->_msg.reserved = 0;
  }
  return result;
}

- (AVMIDIChannelEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  AVMIDIChannelEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMIDIChannelEvent;
  result = -[AVMIDIChannelEvent init](&v5, sel_init);
  if (result)
    result->_msg = *a3;
  return result;
}

- (BOOL)isEqualTo:(id)a3
{
  return *(_QWORD *)&self->_msg.status == *(_QWORD *)objc_msgSend(a3, "message");
}

- (MIDIChannelMessage)message
{
  return &self->_msg;
}

- (unsigned)data1
{
  return -[AVMIDIChannelEvent message](self, "message")[1];
}

- (void)setData1:(unsigned __int8)a3
{
  *(_BYTE *)(-[AVMIDIChannelEvent message](self, "message") + 1) = a3;
}

- (unsigned)data2
{
  return -[AVMIDIChannelEvent message](self, "message")[2];
}

- (void)setData2:(unsigned __int8)a3
{
  *(_BYTE *)(-[AVMIDIChannelEvent message](self, "message") + 2) = a3;
}

@end
