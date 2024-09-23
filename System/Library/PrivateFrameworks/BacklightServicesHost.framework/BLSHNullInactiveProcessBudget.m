@implementation BLSHNullInactiveProcessBudget

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  if (a4 == 1)
    return 2;
  else
    return a4;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  return a3;
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  (*((void (**)(id))a5 + 2))(a5);
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  return 1;
}

@end
