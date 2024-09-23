@implementation StepInDecodeOrderAndReportStepsTaken

uint64_t __remoteSampleCursor_StepInDecodeOrderAndReportStepsTaken_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  char *v4;
  char *v5;
  uint64_t DerivedStorage;
  size_t v7;
  char *dataPointerOut;

  v7 = 0;
  dataPointerOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, 0, &v7, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    v4 = dataPointerOut;
    result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v7 > 0x197)
    {
      *((_QWORD *)dataPointerOut + 50) = 0;
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
      *((_QWORD *)v5 + 1) = 0;
      *((_DWORD *)v5 + 4) = 1935944568;
      *((_QWORD *)v5 + 42) = *(_QWORD *)(a1 + 40);
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      result = 0;
      v5[328] = *(_DWORD *)(*(_QWORD *)DerivedStorage + 40) > 1;
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_StepInDecodeOrderAndReportStepsTaken_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  char *v4;
  _QWORD *v5;
  size_t v6;
  char *dataPointerOut;

  v6 = 0;
  dataPointerOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    v4 = dataPointerOut;
    result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v6 > 0x197)
    {
      v5 = *(_QWORD **)(a1 + 32);
      if (v5)
        *v5 = *((_QWORD *)dataPointerOut + 42);
      result = remoteSampleCursor_updateSimpleCacheViaEventLink(*(_QWORD *)(a1 + 40), (uint64_t)v4);
      if (!(_DWORD)result)
        return remoteSampleCursor_maybeCreateCopiedCursorViaEventLink(*(const void **)(a1 + 40), (uint64_t)v4);
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_StepInDecodeOrderAndReportStepsTaken_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  __int128 v3;
  uint64_t result;
  _OWORD v5[3];

  v3 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v5[0] = *MEMORY[0x1E0CA2E40];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  xpc_dictionary_set_int64(xdict, "SampleCursorStepCount", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  if (result)
  {
    result = FigPartialSampleTableGetDecodeTimeRange(result, v5, 0);
    if (!(_DWORD)result)
      return FigXPCMessageSetCMTimeRange();
  }
  return result;
}

@end
