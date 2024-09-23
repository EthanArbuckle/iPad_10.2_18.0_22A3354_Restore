@implementation AVMIDIProgramChangeEvent

- (AVMIDIProgramChangeEvent)initWithChannel:(UInt32)channel programNumber:(UInt32)programNumber
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMIDIProgramChangeEvent;
  return -[AVMIDIChannelEvent initWithChannel:status:data1:data2:](&v5, sel_initWithChannel_status_data1_data2_, channel, 192, programNumber, 0);
}

- (UInt32)programNumber
{
  return -[AVMIDIChannelEvent data1](self, "data1");
}

- (void)setProgramNumber:(UInt32)programNumber
{
  -[AVMIDIChannelEvent setData1:](self, "setData1:", programNumber);
}

- (AVMIDIProgramChangeEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMIDIProgramChangeEvent;
  return -[AVMIDIChannelEvent initWithMessage:](&v4, sel_initWithMessage_, a3);
}

@end
