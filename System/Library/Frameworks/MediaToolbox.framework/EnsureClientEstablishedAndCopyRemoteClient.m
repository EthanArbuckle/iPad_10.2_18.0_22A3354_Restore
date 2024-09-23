@implementation EnsureClientEstablishedAndCopyRemoteClient

void __remoteFormatReaderClient_EnsureClientEstablishedAndCopyRemoteClient_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  if (!*(_DWORD *)(a1 + 32))
    FigRemote_ShouldConnectToMediaplaybackd();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("FormatReader_ServerConnectionDied"));
  *((_QWORD *)&gFormatReaderRemoteClients + 5 * *(unsigned int *)(a1 + 32) + 3) = FigSimpleMutexCreate();
  *((_DWORD *)&gFormatReaderRemoteClients + 10 * *(unsigned int *)(a1 + 32) + 2) = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

@end
