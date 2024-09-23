@implementation FigSampleBufferConsumerRemoteXPC

void __FigSampleBufferConsumerRemoteXPC_ensureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("FigSampleBufferConsumer_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54B8], (const void *)*MEMORY[0x1E0C9AE50]);
  FigCFDictionarySetInt32();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

@end
