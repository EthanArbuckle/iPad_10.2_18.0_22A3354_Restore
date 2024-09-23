@implementation AVMIDIPitchBendEvent

- (AVMIDIPitchBendEvent)initWithChannel:(UInt32)channel value:(UInt32)value
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMIDIPitchBendEvent;
  return -[AVMIDIChannelEvent initWithChannel:status:data1:data2:](&v5, sel_initWithChannel_status_data1_data2_, channel, 224, value, (value >> 7));
}

- (UInt32)value
{
  int v3;

  v3 = -[AVMIDIChannelEvent data1](self, "data1");
  return v3 | (-[AVMIDIChannelEvent data2](self, "data2") << 7);
}

- (void)setValue:(UInt32)value
{
  -[AVMIDIChannelEvent setData1:](self, "setData1:", value);
  -[AVMIDIChannelEvent setData2:](self, "setData2:", (value >> 7));
}

- (AVMIDIPitchBendEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMIDIPitchBendEvent;
  return -[AVMIDIChannelEvent initWithMessage:](&v4, sel_initWithMessage_, a3);
}

@end
