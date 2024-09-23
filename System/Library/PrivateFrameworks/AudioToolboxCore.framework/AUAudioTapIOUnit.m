@implementation AUAudioTapIOUnit

- (void)setAudioTap:(id)a3
{
  id inData;

  inData = a3;
  AudioUnitSetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x8AEu, 0, 0, inData, 8 * (inData != 0));

}

- (ATAudioTap)audioTap
{
  OSStatus Property;
  BOOL v3;
  UInt32 ioDataSize;
  id outData;

  outData = 0;
  ioDataSize = 8;
  Property = AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x8AEu, 0, 0, &outData, &ioDataSize);
  if (outData)
    v3 = Property == 0;
  else
    v3 = 0;
  if (v3)
    return (ATAudioTap *)outData;
  else
    return (ATAudioTap *)0;
}

@end
