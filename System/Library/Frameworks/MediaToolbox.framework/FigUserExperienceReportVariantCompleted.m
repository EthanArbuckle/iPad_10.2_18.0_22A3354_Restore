@implementation FigUserExperienceReportVariantCompleted

void __FigUserExperienceReportVariantCompleted_block_invoke(uint64_t a1)
{
  const void *v2;

  fus_completeVariantGuts(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) + 1000000 * *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
