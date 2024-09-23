@implementation FigUserExperienceReportStall

void __FigUserExperienceReportStall_block_invoke(uint64_t a1)
{
  uint64_t UpTimeNanoseconds;
  uint64_t v3;
  uint64_t v4;
  const void *v5;

  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  v3 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v3 + 69) = 1;
  if (!*(_BYTE *)(v3 + 68) || (v4 = *(_QWORD *)(v3 + 72), v4 >= UpTimeNanoseconds))
    v4 = UpTimeNanoseconds;
  *(_QWORD *)(v3 + 80) = v4;
  if (*(_QWORD *)(v3 + 88) < v4)
    fus_completeVariantGuts(*(_QWORD *)(a1 + 40), *(_DWORD *)(v3 + 64), UpTimeNanoseconds);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
}

@end
