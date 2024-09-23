@implementation CMPhotoJPEGDecodeSessionDecodeDataToCVPixelBufferAsynchronously

void __CMPhotoJPEGDecodeSessionDecodeDataToCVPixelBufferAsynchronously_block_invoke(uint64_t a1)
{
  int BoolValue_0;
  uint64_t v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFDictionary *v6;
  int v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  const void *v12;

  v12 = 0;
  BoolValue_0 = _getBoolValue_0(*(const __CFDictionary **)(a1 + 40), CFSTR("AsyncDecode"), 0);
  v3 = *(_QWORD *)(a1 + 48);
  if (!BoolValue_0)
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(const __CFData **)(a1 + 64);
    v6 = *(const __CFDictionary **)(a1 + 40);
    v7 = 0;
    goto LABEL_5;
  }
  if (*(_BYTE *)(v3 + 160))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(const __CFData **)(a1 + 64);
    v6 = *(const __CFDictionary **)(a1 + 40);
    v7 = 1;
LABEL_5:
    fjds_createPixelBufferFromJPEGData(v3, v4, v5, v6, &v12, v7);
    goto LABEL_7;
  }
  FigSignalErrorAt();
LABEL_7:
  v8 = *(const void **)(a1 + 64);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
  fjds_removeRequestIDFromInflightList(*(_QWORD *)(a1 + 48), *(const void **)(a1 + 56));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v12;
  (*(void (**)(void))(v10 + 16))();
  if (v11)
    CFRelease(v11);
}

uint64_t __CMPhotoJPEGDecodeSessionDecodeDataToCVPixelBufferAsynchronously_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), 0);
}

@end
