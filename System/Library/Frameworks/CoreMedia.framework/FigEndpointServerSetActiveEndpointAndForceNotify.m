@implementation FigEndpointServerSetActiveEndpointAndForceNotify

void __FigEndpointServerSetActiveEndpointAndForceNotify_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  v3 = (const void *)gActiveEndpoint;
  if (v2 == (const void *)gActiveEndpoint)
  {
    if (!*(_BYTE *)(a1 + 40))
      goto LABEL_8;
  }
  else
  {
    gActiveEndpoint = (uint64_t)v2;
    if (v2)
      CFRetain(v2);
    if (v3)
      CFRelease(v3);
  }
  notify_post("com.apple.coremedia.active-endpoint-changed");
  v2 = *(const void **)(a1 + 32);
LABEL_8:
  if (v2)
    CFRelease(v2);
}

@end
