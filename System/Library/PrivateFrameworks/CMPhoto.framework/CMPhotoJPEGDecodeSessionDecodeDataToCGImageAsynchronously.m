@implementation CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously

void __CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously_block_invoke(uint64_t a1)
{
  int BoolValue_0;
  uint64_t v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFDictionary *v6;
  int v7;
  int v8;
  int v9;
  const void *v10;
  const void *v11;
  const __CFAllocator *v12;
  CVPixelBufferRef v13;
  CFTypeRef cf;
  CVPixelBufferRef pixelBuffer;

  cf = 0;
  pixelBuffer = 0;
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
    v8 = fjds_createPixelBufferFromJPEGData(v3, v4, v5, v6, &pixelBuffer, v7);
    goto LABEL_7;
  }
  v8 = FigSignalErrorAt();
LABEL_7:
  v9 = v8;
  v10 = *(const void **)(a1 + 64);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 40);
  if (v11)
    CFRelease(v11);
  if (!v9)
  {
    v12 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
    v13 = pixelBuffer;
    CMPhotoCreateCGImageWithPixelBuffer(v12, pixelBuffer, *(unsigned __int8 *)(a1 + 72), (CGImageRef *)&cf);
    if (!v13)
      goto LABEL_14;
    goto LABEL_13;
  }
  v13 = pixelBuffer;
  if (pixelBuffer)
LABEL_13:
    CFRelease(v13);
LABEL_14:
  fjds_removeRequestIDFromInflightList(*(_QWORD *)(a1 + 48), *(const void **)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (cf)
    CFRelease(cf);
}

uint64_t __CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), 0);
}

@end
