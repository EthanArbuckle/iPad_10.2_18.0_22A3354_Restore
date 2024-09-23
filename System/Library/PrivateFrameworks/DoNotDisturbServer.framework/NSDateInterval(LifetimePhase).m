@implementation NSDateInterval(LifetimePhase)

- (uint64_t)dnds_lifetimePhaseForDate:()LifetimePhase
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDSGetLifetimePhase(v4, (uint64_t)v5, v6);

  return v7;
}

@end
