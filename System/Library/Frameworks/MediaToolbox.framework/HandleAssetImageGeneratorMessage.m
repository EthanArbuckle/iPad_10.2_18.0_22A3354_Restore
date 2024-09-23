@implementation HandleAssetImageGeneratorMessage

void __HandleAssetImageGeneratorMessage_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t (*v6)(uint64_t, __int128 *, CFTypeRef, uint64_t, CFTypeRef *, __int128 *);
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t (*v11)(uint64_t, __int128 *, _QWORD, uint64_t);
  uint64_t v12;
  CFTypeRef cf;
  CFTypeRef v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v2 = *(_DWORD *)(a1 + 64);
  if (v2 != 1919250737)
  {
    if (v2 != 1668311405)
    {
      v8 = -16158;
      goto LABEL_21;
    }
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 56);
    cf = 0;
    v14 = 0;
    v17 = *MEMORY[0x1E0CA2E18];
    v18 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v15 = v17;
    v16 = v18;
    FigXPCMessageGetCMTime();
    v5 = FigXPCMessageCopyCFDictionary();
    if (!v5)
    {
      v6 = *(uint64_t (**)(uint64_t, __int128 *, CFTypeRef, uint64_t, CFTypeRef *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (!v6)
      {
        v8 = -12782;
LABEL_15:
        if (cf)
          CFRelease(cf);
        if (v14)
          CFRelease(v14);
        goto LABEL_21;
      }
      v7 = *MEMORY[0x1E0C9AE00];
      v19 = v15;
      v20 = v16;
      v5 = v6(v3, &v19, v14, v7, &cf, &v17);
      if (!v5)
      {
        if (cf)
        {
          v8 = serverXPCAIG_AddCGImageToMessage((CGImage *)cf, v4);
          if (!v8)
          {
            v19 = v17;
            v20 = v18;
            FigXPCMessageSetCMTime();
          }
          goto LABEL_15;
        }
        v5 = FigSignalErrorAt();
      }
    }
    v8 = v5;
    goto LABEL_15;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v17 = *MEMORY[0x1E0CA2E68];
  v18 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  FigXPCMessageGetCMTime();
  v10 = FigXPCMessageCopyCFDictionary();
  if (!v10)
  {
    v15 = v17;
    v16 = v18;
    v11 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 16);
    if (!v11)
    {
      v8 = -12782;
      goto LABEL_21;
    }
    v12 = *MEMORY[0x1E0C9AE00];
    v19 = v15;
    v20 = v16;
    v10 = v11(v9, &v19, 0, v12);
  }
  v8 = v10;
LABEL_21:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
}

@end
