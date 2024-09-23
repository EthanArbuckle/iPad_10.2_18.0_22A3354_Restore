@implementation AVMIDIPolyPressureEvent

- (AVMIDIPolyPressureEvent)initWithChannel:(UInt32)channel key:(UInt32)key pressure:(UInt32)pressure
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMIDIPolyPressureEvent;
  return -[AVMIDIChannelEvent initWithChannel:status:data1:data2:](&v6, sel_initWithChannel_status_data1_data2_, channel, 160, key, pressure);
}

- (UInt32)key
{
  return -[AVMIDIChannelEvent data1](self, "data1");
}

- (void)setKey:(UInt32)key
{
  -[AVMIDIChannelEvent setData1:](self, "setData1:", key);
}

- (UInt32)pressure
{
  return -[AVMIDIChannelEvent data2](self, "data2");
}

- (void)setPressure:(UInt32)pressure
{
  -[AVMIDIChannelEvent setData2:](self, "setData2:", pressure);
}

- (AVMIDIPolyPressureEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMIDIPolyPressureEvent;
  return -[AVMIDIChannelEvent initWithMessage:](&v4, sel_initWithMessage_, a3);
}

@end
