@implementation IsAppleTV

void __IsAppleTV_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    IsAppleTV_sIsAppleTV = CFEqual(v0, CFSTR("AppleTV"));
    CFRelease(v1);
  }
}

@end
