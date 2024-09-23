@implementation FigManifoldStartServer

void __FigManifoldStartServer_block_invoke(uint64_t a1)
{
  const __CFAllocator *AllocatorForMedia;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v4;

  AllocatorForMedia = (const __CFAllocator *)FigGetAllocatorForMedia();
  Mutable = CFDictionaryCreateMutable(AllocatorForMedia, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v4 = Mutable;
    FigCFDictionarySetInt32();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCServerStart();
    CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
  }
}

@end
