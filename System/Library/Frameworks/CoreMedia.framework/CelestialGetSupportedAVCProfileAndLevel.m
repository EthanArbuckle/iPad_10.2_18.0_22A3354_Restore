@implementation CelestialGetSupportedAVCProfileAndLevel

void __CelestialGetSupportedAVCProfileAndLevel_block_invoke()
{
  const __CFNumber *v0;
  unsigned int SInt8;
  char v2;

  v0 = (const __CFNumber *)MGCopyAnswer();
  SInt8 = FigCFNumberGetSInt8(v0);
  if (v0)
    CFRelease(v0);
  if (SInt8 <= 0x33)
  {
    if (SInt8 == 51)
    {
      v2 = 51;
    }
    else if (SInt8 <= 0x31)
    {
      if (SInt8 < 0x2A)
        return;
      v2 = 42;
    }
    else
    {
      v2 = 50;
    }
  }
  else
  {
    v2 = 52;
  }
  CelestialGetSupportedAVCProfileAndLevel_sLevel = v2;
}

@end
