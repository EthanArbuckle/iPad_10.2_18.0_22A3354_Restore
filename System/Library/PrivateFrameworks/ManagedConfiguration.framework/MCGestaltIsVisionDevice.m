@implementation MCGestaltIsVisionDevice

void __MCGestaltIsVisionDevice_block_invoke()
{
  __CFString *v0;
  __CFString *v1;

  v0 = (__CFString *)MGCopyAnswer();
  if (!v0)
    v0 = CFSTR("iPhone");
  v1 = v0;
  MCGestaltIsVisionDevice_isVisionDevice = -[__CFString isEqualToString:](v0, "isEqualToString:", CFSTR("RealityDevice"));

}

@end
