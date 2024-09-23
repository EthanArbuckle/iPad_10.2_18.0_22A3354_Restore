@implementation FigPKDOctaviaCPECryptorCreateKeyRequest

void __FigPKDOctaviaCPECryptorCreateKeyRequest_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  int v8;
  int v9;
  const __CFData *v10;
  const UInt8 *BytePtr;
  int v12;
  CFDataRef v13;
  int v14;
  uint64_t v15;
  const void *v16;
  _DWORD length[3];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v6 >= 4uLL && (v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6[11]) != 0)
    v8 = v7(v2, v4, v3, v5 + 24);
  else
    v8 = -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v9 = *(_DWORD *)(a1 + 72);
    v10 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    memset(length, 0, sizeof(length));
    if (v9
      && v10
      && (BytePtr = CFDataGetBytePtr(v10),
          v12 = CFDataGetLength(v10),
          !f5zGmdURga6BZ(v9, (uint64_t)BytePtr, v12, (uint64_t)&length[1], (uint64_t)length)))
    {
      v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const UInt8 **)&length[1], length[0]);
      Ud5PNQt99i(*(uint64_t *)&length[1]);
      if (v13)
        v14 = 0;
      else
        v14 = FigSignalErrorAt();
    }
    else
    {
      v14 = FigSignalErrorAt();
      v13 = 0;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(const void **)(v15 + 24);
      *(_QWORD *)(v15 + 24) = v13;
      if (v13)
        CFRetain(v13);
      if (v16)
        CFRelease(v16);
    }
    if (v13)
      CFRelease(v13);
  }
}

void __FigPKDOctaviaCPECryptorCreateKeyRequest_block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  int v8;
  CFTypeRef v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef cf;

  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 73))
  {
    cf = 0;
    v3 = *(_QWORD *)(v1 + 16);
    v4 = a1[5];
    v5 = a1[6];
    v6 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v6 >= 4uLL && (v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, CFTypeRef *))v6[11]) != 0)
    {
      v8 = v7(v3, v4, v5, &cf);
      v9 = cf;
      v10 = a1[4];
      *(_DWORD *)(v10 + 76) = v8;
      *(_BYTE *)(v10 + 73) = 1;
      if (v9)
        CFRelease(v9);
    }
    else
    {
      v11 = a1[4];
      *(_DWORD *)(v11 + 76) = -12782;
      *(_BYTE *)(v11 + 73) = 1;
    }
  }
}

@end
