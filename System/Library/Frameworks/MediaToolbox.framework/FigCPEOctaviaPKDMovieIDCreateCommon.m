@implementation FigCPEOctaviaPKDMovieIDCreateCommon

void __FigCPEOctaviaPKDMovieIDCreateCommon_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  const void **v7;
  uint64_t v8;

  if (a2 == 1684628836)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v8 + 48))
    {
      (*(void (**)(_QWORD))(v8 + 80))(*(_QWORD *)(v8 + 32));
      v8 = *(_QWORD *)(a1 + 32);
      *(_BYTE *)(v8 + 48) = 0;
    }
    *(_QWORD *)(v8 + 40) = 0;
  }
  else if (a2 == 1651470958)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 56);
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v6 = Mutable;
      v7 = (const void **)MEMORY[0x1E0C9AE40];
      if (v4)
        v7 = (const void **)MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(Mutable, CFSTR("IsProtectionSchemePKDMSE"), *v7);
      if (!FigRemote_CreateSerializedAtomDataBlockBufferForCFType())
      {
        FigTransportGetRemoteRootObject();
        if (!NeroTransportSendSyncMessageCreatingReply())
          CMBlockBufferCopyDataBytes(0, 0, 8uLL, (void *)(v3 + 40));
      }
      CFRelease(v6);
    }
    else
    {
      FigSignalErrorAt();
    }
  }
}

@end
