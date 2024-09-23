@implementation FigCPEOctaviaPKDMovieIDFinalize

void __FigCPEOctaviaPKDMovieIDFinalize_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  NeroTransportSendAsyncMessage();
  NeroTransportUnregisterObject();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 56);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 24);
  if (v4)
    CFRelease(v4);
}

@end
