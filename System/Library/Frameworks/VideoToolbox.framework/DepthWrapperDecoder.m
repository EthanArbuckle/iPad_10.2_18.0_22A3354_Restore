@implementation DepthWrapperDecoder

void __DepthWrapperDecoder_DecodeFrame_block_invoke(uint64_t a1, uint64_t a2, int a3, __CVBuffer *a4)
{
  uint64_t v4;
  __CVBuffer *v6;
  uint64_t v8;
  const __CFAllocator *v9;
  __CVPixelBufferPool *PixelBufferPool;
  uint64_t v11;
  uint64_t DerivedStorage;
  size_t Width;
  size_t Height;
  unsigned __int16 *BaseAddress;
  size_t BytesPerRow;
  char *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  CVPixelBufferRef pixelBufferOut;

  v4 = a2;
  v6 = 0;
  if ((_DWORD)a2)
    a4 = 0;
  pixelBufferOut = 0;
  v8 = a3 & 0xFFFFFFFE | (*(_BYTE *)(a1 + 56) != 0);
  if (!(_DWORD)a2 && a4)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool(*(uint64_t **)(*(_QWORD *)(a1 + 32) + 8));
    v11 = CVPixelBufferPoolCreatePixelBuffer(v9, PixelBufferPool, &pixelBufferOut);
    v6 = pixelBufferOut;
    if ((_DWORD)v11)
    {
      v4 = v11;
    }
    else
    {
      VTVideoDecoderGetCMBaseObject(*(_QWORD *)(a1 + 40));
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      Width = CVPixelBufferGetWidth(a4);
      Height = CVPixelBufferGetHeight(a4);
      CVPixelBufferLockBaseAddress(a4, 1uLL);
      CVPixelBufferLockBaseAddress(v6, 0);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      v17 = (char *)CVPixelBufferGetBaseAddress(v6);
      v18 = CVPixelBufferGetBytesPerRow(v6);
      if (Height)
      {
        v19 = 0;
        v20 = *(_QWORD *)(DerivedStorage + 72);
        do
        {
          if (Width)
          {
            for (i = 0; i != Width; ++i)
              *(_WORD *)&v17[2 * i] = *(_WORD *)(v20 + (((unint64_t)BaseAddress[i] >> 5) & 0x7FE));
          }
          BaseAddress = (unsigned __int16 *)((char *)BaseAddress + BytesPerRow);
          v17 += v18;
          ++v19;
        }
        while (v19 != Height);
      }
      CVPixelBufferUnlockBaseAddress(a4, 1uLL);
      CVPixelBufferUnlockBaseAddress(v6, 0);
      v4 = 0;
      v6 = pixelBufferOut;
    }
  }
  depthdecoder_emitDecodedFrame(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), v4, v8, v6);
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
}

@end
