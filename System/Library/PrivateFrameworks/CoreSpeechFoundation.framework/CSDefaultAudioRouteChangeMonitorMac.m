@implementation CSDefaultAudioRouteChangeMonitorMac

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)isDefaultInputBuiltInMic
{
  return 1;
}

- (BOOL)isDefaultOutputBultInSpeaker
{
  return 1;
}

- (unsigned)defaultOutputAudioDeviceID
{
  return 0;
}

@end
