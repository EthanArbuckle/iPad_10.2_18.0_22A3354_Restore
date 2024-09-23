@implementation CMSMNP

void __CMSMNP_ResumeNowPlayingAppOverCarPlay_block_invoke(uint64_t a1)
{
  const void *v2;

  cmsmSendCommandToMediaRemote(*(_QWORD *)(a1 + 32), 0, CFSTR("com.apple.cmsession.carplay"));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
