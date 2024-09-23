@implementation CPLScheduledOverride

void __54___CPLScheduledOverride__scheduleEndWithTimeInterval___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    objc_msgSend(WeakRetained, "scheduledOverrideDidEnd:", *(_QWORD *)(a1 + 40));

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0;

  }
}

void __70___CPLScheduledOverride_nextTimeIntervalToUseGivenCurrent_expiryDate___block_invoke()
{
  void *v0;

  v0 = (void *)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics;
  nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics = (uint64_t)&unk_1E611B718;

}

@end
