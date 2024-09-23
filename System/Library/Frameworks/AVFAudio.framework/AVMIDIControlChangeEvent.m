@implementation AVMIDIControlChangeEvent

- (AVMIDIControlChangeEvent)initWithChannel:(UInt32)channel messageType:(AVMIDIControlChangeMessageType)messageType value:(UInt32)value
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMIDIControlChangeEvent;
  return -[AVMIDIChannelEvent initWithChannel:status:data1:data2:](&v6, sel_initWithChannel_status_data1_data2_, channel, 176, messageType, value);
}

- (AVMIDIControlChangeMessageType)messageType
{
  return (unint64_t)-[AVMIDIChannelEvent data1](self, "data1");
}

- (UInt32)value
{
  return -[AVMIDIChannelEvent data2](self, "data2");
}

- (AVMIDIControlChangeEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMIDIControlChangeEvent;
  return -[AVMIDIChannelEvent initWithMessage:](&v4, sel_initWithMessage_, a3);
}

@end
