@implementation FigMetricEventTimelineStartServer

void __FigMetricEventTimelineStartServer_block_invoke(uint64_t a1)
{
  const __CFAllocator *AllocatorForPermanentAllocations;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v4;
  _OWORD v5[3];

  v5[0] = xmmword_1E28D9FA8;
  v5[1] = *(_OWORD *)&off_1E28D9FB8;
  v5[2] = xmmword_1E28D9FC8;
  AllocatorForPermanentAllocations = (const __CFAllocator *)FigGetAllocatorForPermanentAllocations();
  Mutable = CFDictionaryCreateMutable(AllocatorForPermanentAllocations, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v4 = Mutable;
    FigCFDictionarySetInt32(Mutable, CFSTR("xpcServerOption_QueuePriority"), 44);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCServerStart((uint64_t)"com.apple.coremedia.mediaplaybackd.figmetriceventtimeline.xpc", (uint64_t)v5, (uint64_t)v4, &gFigMetricEventTimelineServer);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      FigXPCServerActivate(gFigMetricEventTimelineServer);
    CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt(4294947845, 0, 0, 0, 0, 0, 0);
  }
}

@end
