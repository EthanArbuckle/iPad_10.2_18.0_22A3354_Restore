@implementation FigCPEOctaviaPKDMovieIDGetValue

uint64_t __FigCPEOctaviaPKDMovieIDGetValue_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  _QWORD *v3;
  const __CFDictionary *v4;
  uint64_t v5;
  CFDataRef v6;
  __CFDictionary *v7;
  const __CFAllocator *v8;
  CFDataRef v9;
  __CFDictionary *MutableCopy;
  uint64_t (*v11)(uint64_t, const UInt8 *, CFIndex);
  uint64_t v12;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD *v15;
  uint64_t result;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = 0;
  v2 = *(uint64_t **)(a1 + 40);
  if (!v2[5])
  {
    v7 = 0;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = -12158;
LABEL_29:
    *(_DWORD *)(v17 + 24) = v18;
    goto LABEL_21;
  }
  v3 = (_QWORD *)v2[7];
  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PKDKeyManagerGetMovieID(v3, *(CFDictionaryRef *)(a1 + 48), &v19);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_26;
    v4 = *(const __CFDictionary **)(a1 + 48);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PKDMovieIDGetValue(v2[3], *(CFDictionaryRef *)(a1 + 48), &v19);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_26;
    v4 = (const __CFDictionary *)PKDMovieIDGetInfo(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  }
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v5 + 32) = v19;
  if (*(_BYTE *)(v5 + 48))
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_17;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(void))(v5 + 64))();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
LABEL_26:
    v7 = 0;
    goto LABEL_21;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v9)
  {
    v7 = 0;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = -12151;
    goto LABEL_29;
  }
  v6 = v9;
  MutableCopy = CFDictionaryCreateMutableCopy(v8, 0, v4);
  v7 = MutableCopy;
  if (!MutableCopy)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12151;
LABEL_20:
    CFRelease(v6);
    goto LABEL_21;
  }
  CFDictionarySetValue(MutableCopy, CFSTR("DIM"), v6);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRemote_CreateSerializedAtomDataBlockBufferForCFType();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_20;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NeroTransportSendSyncMessageCreatingReply();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_20;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_20;
  v11 = *(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(_QWORD *)(a1 + 40) + 72);
  v12 = v19;
  BytePtr = CFDataGetBytePtr(0);
  Length = CFDataGetLength(0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11(v12, BytePtr, Length);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_20;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = 1;
LABEL_17:
  v15 = *(_QWORD **)(a1 + 56);
  if (v15)
    *v15 = v19;
  if (v6)
    goto LABEL_20;
LABEL_21:
  if (v7)
    CFRelease(v7);
  result = 0;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 40) + 80))(v19);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = 0;
  }
  return result;
}

@end
