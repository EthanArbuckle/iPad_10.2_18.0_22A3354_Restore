@implementation CSSiriAudioServiceGetWorkloop

void __CSSiriAudioServiceGetWorkloop_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.assistant.audio-service-workloop");
  v1 = (void *)CSSiriAudioServiceGetWorkloop_workloop;
  CSSiriAudioServiceGetWorkloop_workloop = (uint64_t)v0;

}

@end
