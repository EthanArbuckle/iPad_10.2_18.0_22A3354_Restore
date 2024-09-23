@implementation FigSteeringManifest

void __FigSteeringManifest_ensureClientEstablished_block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v3;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v3 = Mutable;
    FigCFDictionarySetValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12786;
  }
}

@end
