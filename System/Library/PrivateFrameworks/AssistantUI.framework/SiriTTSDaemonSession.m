@implementation SiriTTSDaemonSession

void __51__SiriTTSDaemonSession_AFAddition__afSharedSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BEA7A10]);
  v1 = (void *)afSharedSession_session;
  afSharedSession_session = (uint64_t)v0;

}

@end
