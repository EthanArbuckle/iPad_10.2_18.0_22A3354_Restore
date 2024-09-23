@implementation SFDeviceIsPad

void ___SFDeviceIsPad_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _SFDeviceIsPad::isPad = CFEqual(v0, CFSTR("iPad")) != 0;
    CFRelease(v1);
  }
}

@end
