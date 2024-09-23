@implementation FigUserExperienceReportSessionEnd

void __FigUserExperienceReportSessionEnd_block_invoke(uint64_t a1)
{
  uint64_t UpTimeNanoseconds;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;

  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 69))
  {
    v5 = *(_QWORD *)(v3 + 96) + *(_QWORD *)(v3 + 48);
    objc_msgSend(*(id *)(v4 + 24), "addStreamStall:end:quality:weight:params:", 0, (double)(*(_QWORD *)(v4 + 80) - v5) / 1000000000.0, (double)(UpTimeNanoseconds - v5) / 1000000000.0, (double)*(int *)(v4 + 64) / 100.0, 1.0);
  }
  else if (!*(_BYTE *)(v4 + 68))
  {
    fus_completeVariantGuts(v3, *(_DWORD *)(v4 + 64), UpTimeNanoseconds);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addStreamEnd:", (double)(UpTimeNanoseconds - (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)))/ 1000000000.0);
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

@end
