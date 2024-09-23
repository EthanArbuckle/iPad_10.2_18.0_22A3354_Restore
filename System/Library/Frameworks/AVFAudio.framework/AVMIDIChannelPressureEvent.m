@implementation AVMIDIChannelPressureEvent

- (AVMIDIChannelPressureEvent)initWithChannel:(UInt32)channel pressure:(UInt32)pressure
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMIDIChannelPressureEvent;
  return -[AVMIDIChannelEvent initWithChannel:status:data1:data2:](&v5, sel_initWithChannel_status_data1_data2_, channel, 208, pressure, 0);
}

- (UInt32)pressure
{
  return -[AVMIDIChannelEvent data1](self, "data1");
}

- (void)setPressure:(UInt32)pressure
{
  -[AVMIDIChannelEvent setData1:](self, "setData1:", pressure);
}

- (AVMIDIChannelPressureEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMIDIChannelPressureEvent;
  return -[AVMIDIChannelEvent initWithMessage:](&v4, sel_initWithMessage_, a3);
}

@end
