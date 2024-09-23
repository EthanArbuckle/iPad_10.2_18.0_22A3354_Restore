@implementation TestReorderingBoundary

double __remoteSampleCursor_TestReorderingBoundary_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
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
      *((_DWORD *)v5 + 4) = 1935830628;
      *((_QWORD *)v5 + 42) = *(int *)(a1 + 48);
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_TestReorderingBoundary_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  size_t v4;
  char *dataPointerOut;

  v4 = 0;
  dataPointerOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, 0, &v4, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v4 > 0x197)
    {
      result = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = dataPointerOut[336];
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_TestReorderingBoundary_block_invoke_64(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "SampleCursorReorderingBoundary", *(int *)(a1 + 32));
  return 0;
}

@end
