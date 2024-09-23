@implementation CreateSampleBuffer

double __remoteSampleCursor_CreateSampleBuffer_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  double result;
  char *v4;
  char *v5;
  size_t v6;
  char *dataPointerOut;

  v6 = 0;
  dataPointerOut = 0;
  if (!CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut))
  {
    v4 = dataPointerOut;
    if ((dataPointerOut & 7) == 0 && v6 > 0x197)
    {
      *((_QWORD *)dataPointerOut + 50) = 0;
      result = 0.0;
      *((_OWORD *)v4 + 23) = 0u;
      *((_OWORD *)v4 + 24) = 0u;
      *((_OWORD *)v4 + 21) = 0u;
      *((_OWORD *)v4 + 22) = 0u;
      *((_OWORD *)v4 + 19) = 0u;
      *((_OWORD *)v4 + 20) = 0u;
      *((_OWORD *)v4 + 17) = 0u;
      *((_OWORD *)v4 + 18) = 0u;
      *((_OWORD *)v4 + 15) = 0u;
      *((_OWORD *)v4 + 16) = 0u;
      *((_OWORD *)v4 + 13) = 0u;
      *((_OWORD *)v4 + 14) = 0u;
      *((_OWORD *)v4 + 11) = 0u;
      *((_OWORD *)v4 + 12) = 0u;
      *((_OWORD *)v4 + 9) = 0u;
      *((_OWORD *)v4 + 10) = 0u;
      *((_OWORD *)v4 + 7) = 0u;
      *((_OWORD *)v4 + 8) = 0u;
      *((_OWORD *)v4 + 5) = 0u;
      *((_OWORD *)v4 + 6) = 0u;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_OWORD *)v4 + 2) = 0u;
      *(_OWORD *)v4 = 0u;
      v5 = dataPointerOut;
      *(_QWORD *)dataPointerOut = *(_QWORD *)(a1 + 32);
      *((_QWORD *)v5 + 1) = *(_QWORD *)(a1 + 40);
      *((_DWORD *)v5 + 4) = 1936941670;
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_CreateSampleBuffer_block_invoke_2(int a1, CMBlockBufferRef theBuffer)
{
  uint64_t DataPointer;
  size_t lengthAtOffsetOut;
  char *dataPointerOut;

  lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  DataPointer = CMBlockBufferGetDataPointer(theBuffer, 0, &lengthAtOffsetOut, 0, &dataPointerOut);
  if (!(_DWORD)DataPointer)
  {
    DataPointer = 4294949526;
    if ((dataPointerOut & 7) == 0 && lengthAtOffsetOut > 0x197)
      return FigInMemoryDeserializerCopyCMSampleBuffer();
  }
  return DataPointer;
}

uint64_t __remoteSampleCursor_CreateSampleBuffer_block_invoke_3()
{
  return 0;
}

@end
