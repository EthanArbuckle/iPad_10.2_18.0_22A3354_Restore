@implementation AFAudioSessionAssertionGetConnectionWorkloop

void __AFAudioSessionAssertionGetConnectionWorkloop_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.assistant.audio-session-assertion.connection-workloop");
  v1 = (void *)AFAudioSessionAssertionGetConnectionWorkloop_workloop;
  AFAudioSessionAssertionGetConnectionWorkloop_workloop = (uint64_t)v0;

}

@end
