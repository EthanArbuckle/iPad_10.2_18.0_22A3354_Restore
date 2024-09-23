@implementation KickStartProcess

void __figMediaParserdUtilities_KickStartProcess_block_invoke()
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v1;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v1 = Mutable;
    FigCFDictionarySetValue();
    figMediaParserdUtilities_KickStartProcess_connectionError = FigXPCRemoteClientCreate();
    CFRelease(v1);
  }
  else
  {
    figMediaParserdUtilities_KickStartProcess_connectionError = -12786;
  }
}

@end
