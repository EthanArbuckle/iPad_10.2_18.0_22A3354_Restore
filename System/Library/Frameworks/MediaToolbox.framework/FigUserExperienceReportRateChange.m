@implementation FigUserExperienceReportRateChange

void __FigUserExperienceReportRateChange_block_invoke(uint64_t a1)
{
  uint64_t UpTimeNanoseconds;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const void *v8;

  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  v3 = UpTimeNanoseconds;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48))
  {
    if (!*(_BYTE *)(v4 + 40))
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        *(_QWORD *)(v5 + 56) = UpTimeNanoseconds;
        v6 = (void *)MEMORY[0x19403137C]();
        objc_msgSend(*(id *)(v5 + 24), "addStreamStart:play:", 0.0, (double)(v3 - (*(_QWORD *)(v5 + 48) + *(_QWORD *)(v5 + 96))) / 1000000000.0);
        objc_autoreleasePoolPop(v6);
        *(_BYTE *)(v5 + 40) = 1;
        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_QWORD *)(v4 + 88) = v3;
    if (*(_BYTE *)(v4 + 69))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) + *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      objc_msgSend(*(id *)(v4 + 24), "addStreamStall:end:quality:weight:params:", 0, (double)(*(_QWORD *)(v4 + 80) - v7) / 1000000000.0, (double)(v3 - v7) / 1000000000.0, (double)*(int *)(a1 + 52) / 100.0, 1.0);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else if (*(_BYTE *)(v4 + 68))
    {
      *(_QWORD *)(v4 + 96) += v3 - *(_QWORD *)(v4 + 72);
    }
    *(_WORD *)(v4 + 68) = 0;
  }
  else if (*(_BYTE *)(v4 + 40))
  {
    *(_BYTE *)(v4 + 68) = 1;
    *(_QWORD *)(v4 + 72) = UpTimeNanoseconds;
    if (!*(_BYTE *)(v4 + 69) && *(_QWORD *)(v4 + 88) < UpTimeNanoseconds)
      fus_completeVariantGuts(*(_QWORD *)(a1 + 40), *(_DWORD *)(v4 + 64), UpTimeNanoseconds);
  }
  v8 = *(const void **)(a1 + 40);
  if (v8)
    CFRelease(v8);
}

@end
