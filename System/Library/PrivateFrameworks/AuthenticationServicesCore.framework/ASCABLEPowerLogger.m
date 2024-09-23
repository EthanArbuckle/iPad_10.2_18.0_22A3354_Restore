@implementation ASCABLEPowerLogger

void __60___ASCABLEPowerLogger_logAuthenticationStartedEventIfNeeded__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __61___ASCABLEPowerLogger_logAuthenticationFinishedEventIfNeeded__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
