@implementation FigByteStreamServerStart

void __FigByteStreamServerStart_block_invoke()
{
  CFMutableDictionaryRef Mutable;
  int v1;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  FigCFDictionarySetValue();
  if (FigServer_IsMediaparserd())
  {
    v1 = FigSignalErrorAt();
  }
  else
  {
    FigServer_IsMediaplaybackd();
    v1 = FigXPCServerStart();
  }
  FigByteStreamServerStart_sByteStreamServerStartResult = v1;
  if (Mutable)
    CFRelease(Mutable);
}

@end
