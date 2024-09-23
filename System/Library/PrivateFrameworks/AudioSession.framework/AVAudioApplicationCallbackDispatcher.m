@implementation AVAudioApplicationCallbackDispatcher

- (void)pingClient:(unsigned int)a3
{
  AVAudioApplicationHandleServerPing(a3);
}

@end
