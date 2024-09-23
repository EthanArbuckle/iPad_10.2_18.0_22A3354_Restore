@implementation SchedulePrimaryTransitionTimerProc

void __fpic_SchedulePrimaryTransitionTimerProc_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t LastCurrentItem;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  char v7;

  v2 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  LastCurrentItem = fpic_GetLastCurrentItem(*(_QWORD *)(a1 + 40), (uint64_t)v2);
  if (LastCurrentItem
    && (v4 = LastCurrentItem, v7 = 0, fpic_ApplyResumptionOffset(*(_QWORD *)(a1 + 40), 1, 0, (uint64_t)v2, &v7), !v7))
  {
    v5 = *(_QWORD *)(a1 + 40);
    fpic_GetItemEndTime(v4, (uint64_t)&v6);
    fpic_scheduleInterstitialAudioTransition(v5, &v6, 0);
    if (!v2)
      return;
  }
  else if (!v2)
  {
    return;
  }
  CFRelease(v2);
}

@end
